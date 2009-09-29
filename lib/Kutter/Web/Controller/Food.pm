package Kutter::Web::Controller::Food;

use strict;
use warnings;
use parent 'Catalyst::Controller';

sub index :Path :Args(1) {
    my ( $self, $c, $arg ) = @_;
    $c->stash->{foods} = $c->model('API')->get_foods( $arg ) if $arg; #xxx
    $c->stash->{template} = 'food.tt2';
}

1;
