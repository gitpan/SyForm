package SyForm::Results::Success;
BEGIN {
  $SyForm::Results::Success::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Trait for SyForm fields of SyForm::Results and SyForm::Values attributes
$SyForm::Results::Success::VERSION = '0.003';
use Moose::Role;
use namespace::autoclean;

# TODO
# use MooseX::Role::WithOverloading;
# use overload q{bool} => 'success';

has success => (
  is => 'ro',
  isa => 'Bool',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Results::Success - Trait for SyForm fields of SyForm::Results and SyForm::Values attributes

=head1 VERSION

version 0.003

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
