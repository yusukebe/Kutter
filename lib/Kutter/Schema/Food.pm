package Kutter::Schema::Food;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("UTF8Columns", "InflateColumn::DateTime", "Core");
__PACKAGE__->table("food");
__PACKAGE__->add_columns(
  "tweet_id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("tweet_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-09-30 14:15:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ma55pa1G3M3VrfEEkZcjDw

__PACKAGE__->has_one(
    'tweet' => 'Kutter::Schema::Tweet',
    { "foreign.id" => "self.tweet_id" }
);

# You can replace this text with custom content, and it will be preserved on regeneration
1;
