package SyForm::Exception::ValidationFailedForTypeConstraint;
BEGIN {
  $SyForm::Exception::ValidationFailedForTypeConstraint::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::ValidationFailedForTypeConstraint::VERSION = '0.010';
use Moose;
extends 'SyForm::Exception';

has moose_exception => (
  isa => 'Moose::Exception::ValidationFailedForTypeConstraint',
  is => 'ro',
  required => 1,
);

has field_name => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

has field_args => (
  is => 'ro',
  isa => 'HashRef',
  required => 1,
);

sub throw_with_args {
  my ( $class, $field_name, $field_args, $moose_exception ) = @_;
  my $message = $moose_exception->is_attribute_set
    ? 'On field ('.$field_name.') the '.lcfirst($moose_exception->message)
    : 'Moose exception at field ('.$field_name.'): '.$moose_exception->message;
  $class->throw($message,
    field_args => $field_args,
    field_name => $field_name,
    moose_exception => $moose_exception,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::ValidationFailedForTypeConstraint

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
