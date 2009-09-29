use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Kutter::Web' }
BEGIN { use_ok 'Kutter::Web::Controller::Food' }

ok( request('/food')->is_success, 'Request should succeed' );


