package Kutter::API::Role;
use Moose::Role;
use Path::Class;
use FindBin;

#xxx
sub path_to {
    my $file = shift;
    return dir ( $file );
}

1;
