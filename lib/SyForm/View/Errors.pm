package SyForm::View::Errors;
BEGIN {
  $SyForm::View::Errors::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Errors on the form itself
$SyForm::View::Errors::VERSION = '0.007';
use Moose::Role;
use namespace::autoclean;

has errors => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  lazy_build => 1,
);

sub _build_errors {
  my ( $self ) = @_;
  [];
}

1;

__END__

=pod

=head1 NAME

SyForm::View::Errors - Errors on the form itself

=head1 VERSION

version 0.007

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
