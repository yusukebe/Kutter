use strict;
use Test::More;
use Encode;

my $yahoo_appid = $ENV{YAHOO_APPID};
if( ! $yahoo_appid ){
    plan( skip_all => 'Please set set YAHOO_APPID to enable this test' );
}else{
    plan( tests => '2' );
}

use_ok('Kutter::CLI::FeedReader');
use_ok('Kutter::CLI::Filter');

my $feed_reader = Kutter::CLI::FeedReader->new();
my $filter = Kutter::CLI::Filter->new( appid => $yahoo_appid );
my $tweets      = $feed_reader->tweets();

for my $tweet ( @$tweets ){
    if( my $food_name = $filter->parse( decode('utf8',$tweet->title ) ) ){
        diag $tweet->title . " ===> " . encode('utf8', $food_name);
    }
}
