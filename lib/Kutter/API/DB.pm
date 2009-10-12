package Kutter::API::DB;
use MooseX::Singleton;
use Carp;
use Kutter::Schema;
use Kutter::Web;

sub schema {
    my $self = shift;
    my $connect_info = Kutter::Web->config->{connect_info} or
        Carp::croak('connect_info is required on kutter_web.conf!');
    return Kutter::Schema->connect( @$connect_info );
}

1;
