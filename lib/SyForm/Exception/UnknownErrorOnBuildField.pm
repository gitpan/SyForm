package SyForm::Exception::UnknownErrorOnBuildField;
BEGIN {
  $SyForm::Exception::UnknownErrorOnBuildField::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Exception at the building of one specific field on a SyForm
$SyForm::Exception::UnknownErrorOnBuildField::VERSION = '0.008';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithOriginalError
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
  my ( $class, $field_name, $field_args, $error ) = @_;
  $class->rethrow_syform_exception($error);
  SyForm->throw( ValidationFailedForTypeConstraint =>
    $field_name, $field_args, $error
  ) if $error->isa('Moose::Exception::ValidationFailedForTypeConstraint');
  $class->throw($class->error_message_text($error).' on building up of field ('.$field_name.')',
    field_args => $field_args,
    field_name => $field_name,
    original_error => $error,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnBuildField - Exception at the building of one specific field on a SyForm

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
