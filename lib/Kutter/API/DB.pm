package Kutter::API::DB;
use MooseX::Singleton;
use Kutter::Schema;

with 'Kutter::API::Role';

sub schema {
    my $self = shift;
    return Kutter::Schema->connect( @{ $self->config->{connect_info} } );
}

1;
