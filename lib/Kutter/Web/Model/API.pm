package Kutter::Web::Model::API;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'Kutter::API',
    constructor => 'new',
);

1;
