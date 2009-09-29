use strict;
use Test::More ( 'no_plan' );

use_ok ( 'Kutter::API' );
my $api = Kutter::API->new;

my $tweets = $api->get_recent_tweets();
isa_ok($tweets, 'DBIx::Class::ResultSet');
my $tweet = $tweets->next;
isa_ok($tweet, 'Kutter::Schema::Tweet');
ok($tweet->id, 'Kutter::Schema::Tweet::id');
ok($tweet->body, 'Kutter::Schema::Tweet::body');
ok($tweet->user_name, 'Kutter::Schema::Tweet::user_name');
isa_ok($tweet->created_on,'DateTime');

isa_ok($api->get_food_tagcloud(),'HTML::TagCloud');
