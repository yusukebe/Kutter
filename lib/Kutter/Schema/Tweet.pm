package Kutter::Schema::Tweet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime", "Core");
__PACKAGE__->table("tweet");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "body",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "user_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-28 21:04:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wdefDg1uv/rcCuLXqa29YA

#xxx
__PACKAGE__->add_columns(
    created_on => { data_type => 'datetime', timezone => "Asia/Tokyo" }
);

sub permalink {
    my $self = shift;
    return sprintf "http://twitter.com/%s/status/%s", $self->user_name, $self->id;
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
