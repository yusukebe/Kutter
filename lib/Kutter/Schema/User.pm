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
    is_nullable => 0,
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
    size => 19,
  },
);
__PACKAGE__->set_primary_key("name");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-09-30 14:15:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:auwGF5vbwybCLwFUYN3tFw

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
