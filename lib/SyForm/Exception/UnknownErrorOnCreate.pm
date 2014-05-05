package SyForm::Exception::UnknownErrorOnCreate;
BEGIN {
  $SyForm::Exception::UnknownErrorOnCreate::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Exception at SyForm->create
$SyForm::Exception::UnknownErrorOnCreate::VERSION = '0.009';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithOriginalError
  SyForm::Exception::Role::WithCreateArgs
);

sub throw_with_args {
  my ( $class, $create_args, $error ) = @_;
  $class->rethrow_syform_exception($error);
  $class->throw($class->error_message_text($error).' on create',
    create_args => $create_args,
    original_error => $error,
  );
}

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnCreate - Exception at SyForm->create

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
