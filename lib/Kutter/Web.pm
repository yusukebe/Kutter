package Kutter::Web;

use strict;
use warnings;
use Catalyst::Runtime 5.80;

use parent qw/Catalyst/;
use Catalyst qw/
                ConfigLoader
                Static::Simple/;
our $VERSION = '0.01';

__PACKAGE__->config( name => 'Kutter::Web', default_view => 'TTSite' );
__PACKAGE__->setup();

1;

__END__

=head1 NAME

Kutter::Web - Catalyst based application

=head1 SYNOPSIS

    script/kutter_web_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Kutter::Web::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Yusuke Wada

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

