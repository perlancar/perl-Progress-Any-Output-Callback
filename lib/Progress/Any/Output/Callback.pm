package Progress::Any::Output::Callback;

use 5.010001;
use strict;
use warnings;

# VERSION

sub new {
    my ($class, %args) = @_;

    $args{callback} or die "Please specify 'callback'";

    bless \%args, $class;
}

sub update {
    $_[0]->{callback}->call(@_);
}

1;
# ABSTRACT: Propagate progress update to a callback function

=for Pod::Coverage ^(update)$

=head1 SYNOPSIS

 use Progress::Any::Output;
 Progress::Any::Output->set('Callback', callback=>sub { ... });


=head1 DESCRIPTION

This output propagates progress update to your specified callback. Callback will
receive what the output's update() receives: C<< $self, %args >> where C<%args>
contains: C<indicator>, C<message>, C<level>, etc.


=head1 METHODS

=head2 new(%args) => OBJ

Instantiate. Usually called through C<<
Progress::Any::Output->set("Callback", %args) >>.

Known arguments:

=over

=item * callback => CODE

Required.

=back


=head1 SEE ALSO

L<Progress::Any>

=cut
