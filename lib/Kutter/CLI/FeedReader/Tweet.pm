package Kutter::CLI::FeedReader::Tweet;
use Moose;
use URI;

has 'id'        => ( is => 'rw', isa => 'Str', );
has 'author'    => ( is => 'rw', isa => 'Str', );
has 'title'     => ( is => 'rw', isa => 'Str' );
has 'content'   => ( is => 'rw', isa => 'Str' );
has 'date'      => ( is => 'rw', isa => 'DateTime' );
has 'image_url' => ( is => 'rw', isa => 'URI' );

no Moose;

sub BUILDARGS {
    my ( $class, $entry ) = @_;
    my ( $id, $author, $date, $image_url );
    if ( $entry->link =~ m!twitter.com/([^/]+)/statuses/(\d+)$! ) {
        $author = $1;
        $id     = $2;
    }
    $date = $entry->issued;
    $date->set_time_zone( 'Asia/Tokyo' );
    $image_url =
      URI->new ( $entry->unwrap->{elem}->getElementsByTagName('link')->[1]
      ->getAttributeNode('href')->value );
    return {
        id        => $id,
        author    => $author,
        title     => $entry->title,
        content   => $entry->content->body,
        date      => $date,
        image_url => $image_url,
    };
}

1;
