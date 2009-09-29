package Kutter::Schema::User;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime", "Core");
__PACKAGE__->table("user");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "image_url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 12:28:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u4n/f8uxVakfP/6p7OTA2g

__PACKAGE__->has_many(
    'tweets' => 'Kutter::Schema::Tweet',
    { "foreign.user_name" => "self.name" }
);

sub permalink {
    my $self = shift;
    return "http://twitter.com/" . $self->name;
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
