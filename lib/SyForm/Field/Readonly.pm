package SyForm::Field::Readonly;
BEGIN {
  $SyForm::Field::Readonly::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: TODO
$SyForm::Field::Readonly::VERSION = '0.005';
die "TODO";

use Moose::Role;
use namespace::autoclean;

has readonly => (
  is => 'ro',
  isa => 'Bool',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Field::Readonly - TODO

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
