package SyForm::Values;
BEGIN {
  $SyForm::Values::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Values::VERSION = '0.003';
use Moose::Role;
use namespace::autoclean;

with qw(
  SyForm::Fields
);

has syform => (
  is => 'ro',
  isa => 'SyForm',
  required => 1,
  handles => [qw(
    field
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Values

=head1 VERSION

version 0.003

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
