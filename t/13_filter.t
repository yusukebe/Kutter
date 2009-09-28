use strict;
use Test::More;
use Encode;
use utf8;

my $yahoo_appid = $ENV{YAHOO_APPID};
if( ! $yahoo_appid ){
    plan( skip_all => 'Please set set YAHOO_APPID to enable this test' );
}else{
    plan( tests => '4' );
}

use_ok('Kutter::CLI::Filter');
my $filter = Kutter::CLI::Filter->new( appid => $yahoo_appid );
my $str;
$str = 'お腹がすいたので、カレーライスを食べた。';
is( $filter->parse( $str ), 'カレーライス', encode('utf8', $str ) );
$str = '私は、フルーツタルトしか食べたこと無い。';
is( $filter->parse( $str ), 'フルーツタルト', encode('utf8', $str ) );

