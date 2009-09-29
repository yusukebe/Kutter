use strict;
use Test::More;
use Encode;

my $yahoo_appid = $ENV{YAHOO_APPID};
if( ! $yahoo_appid ){
    plan( skip_all => 'Please set set YAHOO_APPID to enable this test' );
}else{
    plan( tests => '3' );
}

use_ok('Kutter::CLI::FeedReader');
use_ok('Kutter::CLI::Filter');
use_ok('Kutter::CLI::Crawler');

my $feed_reader = Kutter::CLI::FeedReader->new();
my $filter = Kutter::CLI::Filter->new( appid => $yahoo_appid );
my $crawler = Kutter::CLI::Crawler->new( feed_reader => $feed_reader, filter => $filter );

$crawler->run();

