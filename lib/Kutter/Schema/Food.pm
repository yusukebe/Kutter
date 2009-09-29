package Kutter::Schema::Food;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime", "Core");
__PACKAGE__->table("food");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "tweet_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("name");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 12:28:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qfp1Lp+6edtInSFixupr9Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
