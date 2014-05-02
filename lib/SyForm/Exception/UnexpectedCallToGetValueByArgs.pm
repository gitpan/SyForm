package SyForm::Exception::UnexpectedCallToGetValueByArgs;
BEGIN {
  $SyForm::Exception::UnexpectedCallToGetValueByArgs::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnexpectedCallToGetValueByArgs::VERSION = '0.002';
use Moose;
extends 'Throwable::Error';
use namespace::autoclean;

with qw(
  SyForm::Exception::Role::WithSyFormField
);

around throw => sub {
  my ( $orig, $self, $field ) = @_;
  $self->$orig({
    message => '[ERROR] Unexpected call to get_value_by_args on the field "'.$field->name.'".'."\n\n".
      ' There must be a call to has_value_by_args before using this function, to assure there exist a value.',
    field => $field,
  });
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnexpectedCallToGetValueByArgs

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
