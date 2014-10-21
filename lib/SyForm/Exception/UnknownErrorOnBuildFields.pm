package SyForm::Exception::UnknownErrorOnBuildFields;
BEGIN {
  $SyForm::Exception::UnknownErrorOnBuildFields::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnknownErrorOnBuildFields::VERSION = '0.006';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithSyForm
  SyForm::Exception::Role::WithOriginalError
);

sub throw_with_args {
  my ( $class, $syform, $error ) = @_;
  $class->rethrow_syform_exception($error);
  $class->throw($class->error_message_text($error).' on building up of fields',
    syform => $syform,
    original_error => $error,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnBuildFields

=head1 VERSION

version 0.006

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
