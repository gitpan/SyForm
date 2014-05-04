package SyForm::Field::Process;
BEGIN {
  $SyForm::Field::Process::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for processed fields
$SyForm::Field::Process::VERSION = '0.005';
use Moose::Role;
use namespace::autoclean;

sub has_value_by_args {
  my ( $self, %args ) = @_;
  return exists($args{$self->name}) ? 1 : 0;
}

sub values_args_by_process_args {
  my ( $self, %args ) = @_;
  my $name = $self->name;
  my @roles = $self->values_roles_by_process_args(%args);
  return (
    $self->has_value_by_args(%args)
      ? ( $name, $self->get_value_by_process_args(%args) ) : (),
    scalar @roles
      ? ( roles => [ @roles ] ) : (),
  );
}

sub values_roles_by_process_args { 
  my ( $self, %args ) = @_;
  return;
}

sub get_value_by_process_args {
  my ( $self, %args ) = @_;
  return $self->get_value_by_process_arg($args{$self->name});
}

sub get_value_by_process_arg {
  my ( $self, $arg ) = @_;
  return $arg;
}

sub has_result_by_values {
  my ( $self, $values ) = @_;
  my $has = $self->has_name;
  return $values->$has ? 1 : 0;
}

sub results_args_by_values {
  my ( $self, $values ) = @_;
  my $name = $self->name;
  my @roles = $self->results_roles_by_values($values);
  return (
    $self->has_result_by_values($values)
      ? ( $self->name, $self->get_result_by_values($values) ) : (),
    scalar @roles
      ? ( roles => [ @roles ] ) : (),
  );
}

sub results_roles_by_values {
  my ( $self, $values ) = @_;
  return;
}

sub get_result_by_values {
  my ( $self, $values ) = @_;
  my $name = $self->name;
  return $self->get_result_by_value($values->$name);
}

sub get_result_by_value {
  my ( $self, $value ) = @_;
  return $value;
}

sub view_args_by_results {
  my ( $self, $results ) = @_;
  my $name = $self->name;
  my @roles = $self->view_roles_by_results($results);
  my @viewfield_roles = $self->view_roles_by_results($results);
  return (
    scalar @roles
      ? ( roles => [ @roles ] ) : (),
    scalar @viewfield_roles
      ? ( viewfield_roles => [ @viewfield_roles ] ) : (),
    $self->custom_view_args_by_results,
  );
}

sub custom_view_args_by_results {
  my ( $self, $results ) = @_;
  return;
}

sub view_roles_by_results {
  my ( $self, $values ) = @_;
  return;
}

sub viewfield_roles_by_results {
  my ( $self, $results ) = @_;
  return;
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::Process - Role for processed fields

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
