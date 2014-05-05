package SyForm::Results::Verify;
BEGIN {
  $SyForm::Results::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Trait for SyForm fields of SyForm::Results and SyForm::Values attributes
$SyForm::Results::Verify::VERSION = '0.009';
use Moose::Role;
use namespace::clean -except => 'meta';

has validation_class => (
  is => 'ro',
  isa => 'Validation::Class::Simple',
  required => 1,
);

has error_count => (
  is => 'ro',
  isa => 'Int',
  lazy_build => 1,
);

sub _build_error_count {
  my ( $self ) = @_;
  $self->validation_class->error_count;
}

1;

__END__

=pod

=head1 NAME

SyForm::Results::Verify - Trait for SyForm fields of SyForm::Results and SyForm::Values attributes

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
