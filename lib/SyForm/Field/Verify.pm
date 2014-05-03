package SyForm::Field::Verify;
BEGIN {
  $SyForm::Field::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Required field
$SyForm::Field::Verify::VERSION = '0.004';
use Moose::Role;
use namespace::autoclean;

has required => (
  is => 'ro',
  isa => 'Bool',
  predicate => 'has_required',
);

has type => (
  is => 'ro',
  isa => 'Str',
  predicate => 'has_type',
);

has verify_filters => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  predicate => 'has_verify_filters',
);

has no_delete_on_invalid_result => (
  is => 'ro',
  isa => 'Bool',
  default => sub { 0 },
);

around results_roles_by_values => sub {
  my ( $orig, $self, $values ) = @_;
  return $self->$orig($values), qw(
    SyForm::Results::Success SyForm::Results::Verify
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Field::Verify - Required field

=head1 VERSION

version 0.004

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
