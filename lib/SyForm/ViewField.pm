package SyForm::ViewField;
BEGIN {
  $SyForm::ViewField::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for fields inside a SyForm::View
$SyForm::ViewField::VERSION = '0.009';
use Moose::Role;
use namespace::clean -except => 'meta';

with qw(
  MooseX::Traits
);

has view => (
  is => 'ro',
  isa => 'SyForm::View',
  required => 1,
  handles => [qw(
    viewfield
    results
  )],
);

has field => (
  is => 'ro',
  isa => 'SyForm::Field',
  required => 1,
  handles => [qw(
    syform
  )],
);

sub has_value {
  my ( $self ) = @_;
  my $name = $self->field->name;
  $self->results->values->has_value($name);
}

sub value {
  my ( $self ) = @_;
  my $name = $self->field->name;
  $self->results->values->get_value($name);
}

sub has_result {
  my ( $self ) = @_;
  my $name = $self->field->name;
  $self->results->has_result($name);
}

sub result {
  my ( $self ) = @_;
  my $name = $self->field->name;
  $self->results->get_result($name);
}

sub val {
  my ( $self ) = @_;
  return $self->result if $self->has_result;
  return $self->value if $self->has_value;
}

1;

__END__

=pod

=head1 NAME

SyForm::ViewField - Role for fields inside a SyForm::View

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
