package Queens;
use Moose;

has size => (is => 'ro', required => 1, isa => 'Num');

use namespace::autoclean;
use Carp qw/croak/;

sub BUILDARGS {
    my ($class, $size) = @_;
    croak "Size must be strictly positive" if $size < 1;
    return { size => $size };
}

sub next_allowed {
    return ();
}

1;
