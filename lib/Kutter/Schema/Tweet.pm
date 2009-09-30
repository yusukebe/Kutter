package Kutter::Schema::Tweet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime", "Core");
__PACKAGE__->table("tweet");
__PACKAGE__->add_columns(
  "id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "body",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
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
    size => 19,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-09-30 14:15:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uAwUH7Xv5RYWmKbkMUaAXg

#xxx
__PACKAGE__->add_columns(
    created_on => { data_type => 'datetime', timezone => "Asia/Tokyo" }
);

__PACKAGE__->belongs_to(
    'user' => 'Kutter::Schema::User',
    { "foreign.name" => "self.user_name" }
);

__PACKAGE__->might_have(
    'food' => 'Kutter::Schema::Food',
    { "foreign.tweet_id" => "self.id" }
);

sub permalink {
    my $self = shift;
    return sprintf "http://twitter.com/%s/status/%s", $self->user_name, $self->id;
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
