package SyForm::Exception::UnknownErrorOnCreate;
BEGIN {
  $SyForm::Exception::UnknownErrorOnCreate::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnknownErrorOnCreate::VERSION = '0.002';
use Moose;
extends 'Throwable::Error';
use namespace::autoclean;

with qw(
  SyForm::Exception::Role::WithOriginalError
);

has create_args => (
  is => 'ro',
  isa => 'ArrayRef',
  required => 1,
);

around throw => sub {
  my ( $orig, $self, $create_args, $error ) = @_;
  $self->$orig({
    message => '[ERROR] Unknown error on create of SyForm'."\n\n".
      ' Original error message:'."\n\n".$error,
    create_args => $create_args,
    original_error => $error,
  });
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnCreate

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
