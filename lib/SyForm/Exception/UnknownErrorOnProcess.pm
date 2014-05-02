package SyForm::Exception::UnknownErrorOnProcess;
BEGIN {
  $SyForm::Exception::UnknownErrorOnProcess::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnknownErrorOnProcess::VERSION = '0.002';
use Moose;
extends 'Throwable::Error';
use namespace::autoclean;

with qw(
  SyForm::Exception::Role::WithSyForm
  SyForm::Exception::Role::WithOriginalError
);

has process_args => (
  is => 'ro',
  isa => 'ArrayRef',
  required => 1,
);

around throw => sub {
  my ( $orig, $self, $syform, $process_args, $error ) = @_;
  $self->$orig({
    message => '[ERROR] Unknown error on process of SyForm'."\n\n".
      ' Original error message:'."\n\n".$error,
    syform => $syform,
    original_error => $error,
    process_args => $process_args,
  });
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnProcess

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
