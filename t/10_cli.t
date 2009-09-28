use strict;
use Test::More ('no_plan');

use_ok('Kutter::CLI::FeedReader');

my $feed_reader = Kutter::CLI::FeedReader->new();
my $tweets      = $feed_reader->tweets();
is( ref $tweets, 'ARRAY', 'Feed::CLI::FeedReader::tweets return ARRAY Ref' );
isa_ok( $tweets->[0], 'Kutter::CLI::FeedReader::Tweet' );
ok( $tweets->[0]->id,      'Kutter::CLI::FeedReader::Tweet::id' );
ok( $tweets->[0]->author,  'Kutter::CLI::FeedReader::Tweet::author' );
ok( $tweets->[0]->title,   'Kutter::CLI::FeedReader::Tweet::title' );
ok( $tweets->[0]->content, 'Kutter::CLI::FeedReader::Tweet::content' );
isa_ok( $tweets->[0]->date,      'DateTime' );
isa_ok( $tweets->[0]->image_url, 'URI' );
