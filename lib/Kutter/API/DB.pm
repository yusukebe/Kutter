package Kutter::API::DB;
use MooseX::Singleton;
use Kutter::Schema;

with 'Kutter::API::Role';

sub schema {
    return Kutter::Schema->connect(
        'dbi:SQLite:dbname=' . path_to("db/kutter.db") );
}

1;
