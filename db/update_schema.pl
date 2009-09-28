#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use DBIx::Class::Schema::Loader qw/make_schema_at/;

my $schema_class = "Kutter::Schema";
my $connect_info = [ "dbi:SQLite:dbname=$FindBin::Bin/kutter.db"];

make_schema_at(
    $schema_class,
    {
        components     => [qw/UTF8Columns InflateColumn::DateTime/],
        dump_directory => File::Spec->catfile( "$FindBin::Bin/../lib" ),
        debug          => 1,
    },
    $connect_info,
);
