package SyForm::Field::Default;
BEGIN {
  $SyForm::Field::Default::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: A default for a field
$SyForm::Field::Default::VERSION = '0.001';
use Moose::Role;
use Moose::Util qw( apply_all_roles );
use namespace::autoclean;

has default => (
  is => 'ro',
  predicate => 'has_default',
);

sub BUILD {
  my ( $self ) = @_;
  apply_all_roles( $self->syform, 'SyForm::Defaults' ) unless $self->syform->does('SyForm::Defaults');
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::Default - A default for a field

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
