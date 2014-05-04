package SyForm::Exception::UnknownErrorOnProcessResults;
BEGIN {
  $SyForm::Exception::UnknownErrorOnProcessResults::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnknownErrorOnProcessResults::VERSION = '0.005';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithSyForm
  SyForm::Exception::Role::WithOriginalError
);

has process_results_args => (
  is => 'ro',
  isa => 'ArrayRef',
  required => 1,
);

sub throw_with_args {
  my ( $class, $syform, $process_results_args, $original_error ) = @_;
  $class->rethrow_syform_exception($original_error);
  $class->throw($class->error_message_text($original_error).' on process_results',
    syform => $syform,
    original_error => $original_error,
    process_results_args => $process_results_args,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnProcessResults

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
