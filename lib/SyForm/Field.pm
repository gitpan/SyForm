package SyForm::Field;
BEGIN {
  $SyForm::Field::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for fields in SyForm
$SyForm::Field::VERSION = '0.005';
use Moose::Role;

with qw(
  MooseX::Traits
);

has syform => (
  is => 'ro',
  isa => 'SyForm',
  weak_ref => 1,
  required => 1,
);

has name => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

has has_name => (
  is => 'ro',
  isa => 'Str',
  lazy_build => 1,
);
sub _build_has_name { 'has_'.($_[0]->name) }

1;

__END__

=pod

=head1 NAME

SyForm::Field - Role for fields in SyForm

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
