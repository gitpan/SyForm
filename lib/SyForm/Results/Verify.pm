package SyForm::Results::Verify;
BEGIN {
  $SyForm::Results::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Trait for SyForm fields of SyForm::Results and SyForm::Values attributes
$SyForm::Results::Verify::VERSION = '0.005';
use Moose::Role;
use namespace::autoclean;

has verify_results => (
  is => 'ro',
  isa => 'Data::Verifier::Results',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Results::Verify - Trait for SyForm fields of SyForm::Results and SyForm::Values attributes

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
