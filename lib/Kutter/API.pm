package Kutter::API;
use Moose;
use Kutter::API::DB;

no Moose;

sub get_recent_tweets {
    my ( $self, $page ) = @_;
    $page ||= 1;
    my $schema = Kutter::API::DB->schema;
    return $schema->resultset('Tweet')->search(
        {},
        {
            rows     => 20,
            page     => $page,
            order_by => 'created_on DESC',
        }
    );
}

1;

__END__
