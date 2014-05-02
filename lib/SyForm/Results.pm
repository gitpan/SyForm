package SyForm::Results;
BEGIN {
  $SyForm::Results::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Results::VERSION = '0.002';
use Moose::Role;
use namespace::autoclean;

with qw(
  SyForm::Fields
);

# TODO
# use MooseX::Role::WithOverloading;
# use overload q{%{}} => 'as_hashref';

has values => (
  is => 'ro',
  isa => 'SyForm::Values',
  required => 1,
  handles => [qw(
    syform
    field
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Results

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
