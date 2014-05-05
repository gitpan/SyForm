package SyForm::Field::Verify;
BEGIN {
  $SyForm::Field::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: SyForm::Verify configuration of the field
$SyForm::Field::Verify::VERSION = '0.009';
use Moose::Role;
use namespace::clean -except => 'meta';

our @validation_class_directives = qw(
  required
  between
  date
  decimal
  depends_on
  email
  error
  hostname
  length
  matches
  time
  options
  pattern
  messages
  filters
  readonly
  max_alpha
  max_digits
  max_length
  max_sum
  max_symbols
  min_alpha
  min_digits
  min_length
  min_sum
  min_symbols
);

for (@validation_class_directives) {
  has $_ => (
    is => 'ro',
    predicate => 'has_'.$_,
  );
}

has no_delete_on_invalid_result => (
  is => 'ro',
  isa => 'Bool',
  default => sub { 0 },
);

around values_roles_by_process_args => sub {
  my ( $orig, $self, %args ) = @_;
  return $self->$orig(%args), qw(
    SyForm::Values::Verify
  );
};

around results_roles_by_values => sub {
  my ( $orig, $self, $values ) = @_;
  return $self->$orig($values), qw(
    SyForm::Results::Success
    SyForm::Results::Verify
  );
};

around viewfield_roles_by_results => sub {
  my ( $orig, $self, $results ) = @_;
  return $self->$orig($results), qw( SyForm::ViewField::Verify );
};

around view_roles_by_results => sub {
  my ( $orig, $self, $results ) = @_;
  return $self->$orig($results), qw( SyForm::View::Success );
};

1;

__END__

=pod

=head1 NAME

SyForm::Field::Verify - SyForm::Verify configuration of the field

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
