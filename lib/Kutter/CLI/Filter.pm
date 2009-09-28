package Kutter::CLI::Filter;
use Moose;
use Carp;
use Encode;
use WebService::Simple;
use WebService::Simple::Parser::XML::Simple;
use XML::Simple;
use YAML;
use utf8;

has 'appid' => ( is => 'rw', isa => 'Str', required => 1 );
has 'service' => ( is => 'rw', isa => 'WebService::Simple', lazy_build => 1 );

no Moose;

sub _build_service {
    my $self   = shift;
    my $xs     = XML::Simple->new( ForceArray => [ qw/Chunk Morphem/ ] );
    my $parser = WebService::Simple::Parser::XML::Simple->new( xs => $xs );
    return WebService::Simple->new(
        base_url => 'http://jlp.yahooapis.jp/DAService/V1/parse',
        param    => {
            appid           => $self->appid,
        },
        response_parser => $parser,
    );
}

sub parse {
    my ( $self, $str ) = @_;
    Carp::croak('Sentence Text is requred!') unless $str;
    my $res = $self->service->get( { sentence => $str } );
    my $ref = $res->parse_response();

    my ( $eat_chunk_id, $food_name ) = ('','');

    my @chunks = @{ $ref->{Result}{ChunkList}{Chunk} };
    for my $chunk (@chunks) {
        if ( $chunk->{MorphemList}{Morphem}[0]{Baseform} =~ /食べ/ ) {
            $eat_chunk_id = $chunk->{Id};
            last;
        }
        else {
            my $count = 0;
            for my $morphem ( @{ $chunk->{MorphemList}{Morphem} } ) {
                if ( $morphem->{Baseform} =~ /食べ/ ) {
                    while ($count) {
                        $count--;
                        if ( $chunk->{MorphemList}{Morphem}[$count]->{POS} =~
                            /名詞/ )
                        {
                            $food_name .=
                              $chunk->{MorphemList}{Morphem}[$count]{Baseform};
                        }
                        else {
                            last;
                        }
                    }
                    last;
                }
                $count++;
            }
        }
    }

    if ( $eat_chunk_id && !$food_name ) {
        my $flag = 0;
        for my $chunk (reverse @chunks) {
            if ( $chunk->{Dependency} == $eat_chunk_id && !$flag ) {
                for my $morphem (
                    reverse @{ $chunk->{MorphemList}{Morphem} } ) {
                    if ( $morphem->{POS} =~ /名詞/ ) {
                        $food_name = $morphem->{Baseform} . $food_name;
                        $flag = 1;
                    }else{
                        return $food_name if $flag;
                    }
                }
            }
        }
    }

    return $food_name;

}

1;
__END__
