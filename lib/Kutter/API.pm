package Kutter::API;
use Moose;
use Kutter::API::DB;
use Encode;
use HTML::TagCloud;
use URI::Escape;

no Moose;

sub get_recent_tweets {
    my ( $self, $page ) = @_;
    $page ||= 1;
    my $schema = Kutter::API::DB->schema;
    return $schema->resultset('Tweet')->search(
        {},
        {
            rows     => 20,
            page     => $page,
            order_by => 'created_on DESC',
        }
    );
}

sub get_food_tagcloud {
    my ( $self, $base_url ) = @_;
    my $schema    = Kutter::API::DB->schema;
    my $foods     = $schema->resultset('Food')->search(
        {},
        {
            '+select' => [ { count => 'name' } ],
            '+as'     => ['count'],
            rows      => 100,
            page      => 1,
            group_by  => 'name',
            order_by  => 'tweet_id DESC',
        }
    );
    my $cloud = HTML::TagCloud->new();
    while ( my $food = $foods->next ) {
        $cloud->add(
            $food->name,
            $base_url . URI::Escape::uri_escape_utf8( decode('utf8', $food->name) ),
            $food->get_column('count')
        );
    }
    return $cloud;
}

1;

__END__
