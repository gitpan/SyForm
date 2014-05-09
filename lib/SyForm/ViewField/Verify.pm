package SyForm::ViewField::Verify;
BEGIN {
  $SyForm::ViewField::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Trait for SyForm fields of SyForm::Results and SyForm::Values attributes
$SyForm::ViewField::Verify::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

sub is_invalid {
  my ( $self ) = @_;
  return $self->is_valid ? 0 : 1;
}

has is_valid => (
  is => 'ro',
  isa => 'Int',
  lazy_build => 1,
);

sub _build_is_valid {
  my ( $self ) = @_;
  return $self->results->validation_class->is_valid($self->name) ? 1 : 0;
}

has errors => (
  is => 'ro',
  isa => 'ArrayRef',
  lazy_build => 1,
);

sub _build_errors {
  my ( $self ) = @_;
  return [ $self->results->validation_class->get_errors($self->name) ];
}

# sub has_original_value {
#   my ( $self ) = @_;
#   return $self->has_value;
# }

# sub original_value {
#   my ( $self ) = @_;
#   return $self->results->verify_results->get_original_value($self->name);
# }

1;

__END__

=pod

=head1 NAME

SyForm::ViewField::Verify - Trait for SyForm fields of SyForm::Results and SyForm::Values attributes

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
