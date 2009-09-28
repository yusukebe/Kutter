package Kutter::API::Role;
use Moose::Role;
use Path::Class;
use FindBin;
use Kutter::Web;

#xxx
sub path_to {
    my $file = shift;
    return Kutter::Web->path_to( $file );
}

1;
