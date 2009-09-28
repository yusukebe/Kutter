#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib ( "$FindBin::Bin/../lib" );
use Kutter::CLI::FeedReader;
use Kutter::CLI::Crawler;

my $feed_reader = Kutter::CLI::FeedReader->new();
my $crawler = Kutter::CLI::Crawler->new( feed_reader => $feed_reader );

$crawler->run();
