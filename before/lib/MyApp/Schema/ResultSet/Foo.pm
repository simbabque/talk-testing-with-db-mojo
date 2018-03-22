package MyApp::Schema::ResultSet::Foo;
use Moose;
extends 'DBIx::Class::ResultSet';

sub last {
    my $self = shift;
    return $self->search(
        {},
        {
            order_by => { -desc => 'id' }
        }
    )->first;
}

1;
