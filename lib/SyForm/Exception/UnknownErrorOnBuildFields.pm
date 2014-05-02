package SyForm::Exception::UnknownErrorOnBuildFields;
BEGIN {
  $SyForm::Exception::UnknownErrorOnBuildFields::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnknownErrorOnBuildFields::VERSION = '0.002';
use Moose;
extends 'Throwable::Error';
use namespace::autoclean;

with qw(
  SyForm::Exception::Role::WithSyForm
  SyForm::Exception::Role::WithOriginalError
);

around throw => sub {
  my ( $orig, $self, $syform, $error ) = @_;
  $self->$orig({
    message => '[ERROR] Unknown error on building up of fields'."\n\n".
      ' Original error message:'."\n\n".$error,
    syform => $syform,
    original_error => $error,
  });
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnknownErrorOnBuildFields

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
