#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib ( "$FindBin::Bin/../lib" );
use Kutter::CLI::FeedReader;
use Kutter::CLI::Crawler;
use Kutter::CLI::Filter;

my $feed_reader = Kutter::CLI::FeedReader->new();
my $filter = Kutter::CLI::Filter->new( appid => 'your appid of YAHOO API');
my $crawler = Kutter::CLI::Crawler->new( feed_reader => $feed_reader );

$crawler->run();
