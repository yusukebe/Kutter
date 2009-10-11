#!/usr/bin/perl
use strict;
use URI::Escape qw/uri_escape_utf8/;
use XML::Feed;
use utf8;

my $query = '食べた';
my $url  = 'http://search.twitter.com/search.atom?q=' . uri_escape_utf8($query);
my $feed = XML::Feed->parse( URI->new($url) );
for my $entry ( $feed->entries ) {
    print $entry->title . "\n";
}
