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
    my $self = shift;
    my @already_seen = @_;
    my $current_col = scalar(@already_seen);
    # Whatever is not forbidden is permitted
    my @allowed = (1) x $self->size;
    # Disallow rows we've already used
    $allowed[$_] = 0 for @already_seen;
    # Disallow anything on the same diagonal as something we've already seen
    for my $col (0.. ($current_col - 1)) {
        my $distance = $current_col - $col;
        my $upper_diag = $already_seen[$col] + $distance;
        my $lower_diag = $already_seen[$col] - $distance;
        $allowed[$upper_diag] = 0 if $upper_diag < $self->size;
        $allowed[$lower_diag] = 0 if $lower_diag >= 0;
    }
    return grep { $allowed[$_] == 1 } (0 .. $#allowed);
}

1;
