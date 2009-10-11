package Kutter::CLI::FeedReader;
use Moose;
use Carp;
use URI;
use XML::Feed;
use Kutter::CLI::FeedReader::Tweet;

has 'url' => (
    is      => 'rw',
    isa     => 'URI',
    default => sub {
        URI->new(
           'http://search.twitter.com/search.atom?q=%E9%A3%9F%E3%81%B9%E3%81%9F'
        );
    },
);

no Moose;

sub entries {
    my $self = shift;
    my $feed = XML::Feed->parse( $self->url )
      or Carp::croak( XML::Feed->errstr );
    return $feed->entries;
}

sub tweets {
    my $self = shift;
    my @tweets;
    my @entries = $self->entries;
    for my $entry (@entries) {
        push( @tweets, Kutter::CLI::FeedReader::Tweet->new($entry) );
    }
    return \@tweets;
}

1;
__END__
