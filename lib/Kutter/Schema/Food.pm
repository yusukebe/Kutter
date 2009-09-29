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
  "eat_count",
  { data_type => "INTEGER", default_value => 1, is_nullable => 1, size => undef },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "updated_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("name");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 12:12:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n3KKR+AGhRvnD1h5xr6lxA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
