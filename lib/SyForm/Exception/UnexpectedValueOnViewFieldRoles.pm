package SyForm::Exception::UnexpectedValueOnViewFieldRoles;
BEGIN {
  $SyForm::Exception::UnexpectedValueOnViewFieldRoles::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnexpectedValueOnViewFieldRoles::VERSION = '0.007';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithSyFormField
);

has error_ref => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

sub throw_with_args {
  my ( $class, $field, $error_ref ) = @_;
  $class->throw('Unexpected value on viewfield_roles of field ('.
    $field->name.') view args with ref ('.$error_ref.').',
    field => $field,
    error_ref => $error_ref,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnexpectedValueOnViewFieldRoles

=head1 VERSION

version 0.007

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
