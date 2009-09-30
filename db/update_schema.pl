#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib ( "$FindBin::Bin/../lib" );
use DBIx::Class::Schema::Loader qw/make_schema_at/;
use Kutter::Web; #xxx

my $schema_class = "Kutter::Schema";

make_schema_at(
    $schema_class,
    {
        components     => [qw/UTF8Columns InflateColumn::DateTime/],
        dump_directory => File::Spec->catfile( "$FindBin::Bin/../lib" ),
        debug          => 1,
    },
    Kutter::Web->config->{connect_info},
);
