use strict;
use Test::More ('no_plan');
use Kutter::CLI::FeedReader;

use_ok('Kutter::CLI::Crawler');

my $feed_reader = Kutter::CLI::FeedReader->new();
my $crawler = Kutter::CLI::Crawler->new( feed_reader => $feed_reader );

$crawler->run();
