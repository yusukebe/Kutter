package Kutter::API;
use Moose;
use Kutter::API::DB;

no Moose;

sub get_recent_tweets {
    my $self = shift;
    my $schema = Kutter::API::DB->schema;
    return $schema->resultset('Tweet')->search({},{
        rows => 20,
        page => 1,
        order_by => 'created_on DESC',
    });
}

1;

__END__
