package Kutter::Web::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Data::Page::Navigation;

__PACKAGE__->config->{namespace} = '';

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my $page = $c->req->param('page') || 1;
    $c->stash->{tweets} = $c->model('API')->get_recent_tweets( $page );
    $c->stash->{cloud}  = $c->model('API')->get_food_tagcloud();
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

1;

__END__
