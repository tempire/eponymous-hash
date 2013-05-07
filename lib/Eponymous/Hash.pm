package Eponymous::Hash;
use PadWalker 'var_name';

sub import {
  shift;
  my $name = pop || 'eponymous_hash';
  my $calling_class = caller;

  *{"${calling_class}::$name"} = \&eponymous_hash;
}

sub eponymous_hash {
  return map { substr(var_name(1, \$_), 1) => $_ } @_;
}

1;

=head1 NAME

Eponymous::Hash - Translates named variables to a hash list with corresponding keys

=head1 DESCRIPTION

Translates named variables to a hash list with corresponding keys

=head1 USAGE

  use Eponymous::Hash;

  my $mammal = 'ponycorn';
  my $diet   = 'sprinkles';

  my %hash = eponymous_hash($mammal, $diet)
  # (mammal => 'ponycorn', diet => 'sprinkles')

  use Eponymous::Hash 'epy'
  my %hash = epy($mammal, $diet);

=head1 METHODS

=head2 eponymous_hash

Default method name.  If parameter is passed to use statement, parameter will be used instead.

=head1 AUTHOR

Glen Hinkle
