package SyForm::Field::Default;
BEGIN {
  $SyForm::Field::Default::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: A default for a field
$SyForm::Field::Default::VERSION = '0.002';
use Moose::Role;
use SyForm::Exception::UnexpectedCallToGetValueByArgs;
use namespace::autoclean;

with qw(
  SyForm::Field::Process
);

has default => (
  is => 'ro',
  predicate => 'has_default',
);

around has_value_by_args => sub {
  my ( $orig, $self, %args ) = @_;
  return 1 if $self->$orig(%args);
  return 1 if $self->has_default;
  return 0;
};

around get_value_by_args => sub {
  my ( $orig, $self, %args ) = @_;
  return $self->$orig(%args) if $self->has_value_by_args(%args);
  return $self->default if $self->has_default;
  SyForm::Exception::UnexpectedCallToGetValueByArgs->throw($self);
};

1;

__END__

=pod

=head1 NAME

SyForm::Field::Default - A default for a field

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
