package SyForm::Exception::UnexpectedArgToCreate;
BEGIN {
  $SyForm::Exception::UnexpectedArgToCreate::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::UnexpectedArgToCreate::VERSION = '0.006';
use Moose;
extends 'SyForm::Exception';

with qw(
  SyForm::Exception::Role::WithCreateArgs
);

has error_ref => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

sub throw_with_args {
  my ( $class, $create_args, $ref ) = @_;
  $class->throw('Unexpected parameter to create with reference type ('.
    $ref.').',
    create_args => $create_args,
    error_ref => $ref,
  );
};

1;

__END__

=pod

=head1 NAME

SyForm::Exception::UnexpectedArgToCreate

=head1 VERSION

version 0.006

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
