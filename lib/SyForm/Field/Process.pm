package SyForm::Field::Process;
BEGIN {
  $SyForm::Field::Process::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for processed fields
$SyForm::Field::Process::VERSION = '0.002';
use Moose::Role;
use SyForm::Exception::UnexpectedCallToGetValueByArgs;
use namespace::autoclean;

sub has_value_by_args {
  my ( $self, %args ) = @_;
  return exists($args{$self->name}) ? 1 : 0;
}

sub get_value_by_args {
  my ( $self, %args ) = @_;
  SyForm::Exception::UnexpectedCallToGetValueByArgs->throw($self)
    unless $self->has_value_by_args(%args);
  return $self->get_value_by_arg($args{$self->name});
}

sub get_value_by_arg {
  my ( $self, $arg ) = @_;
  return $arg;
}

sub has_result_by_values {
  my ( $self, $values ) = @_;
  my $has = 'has_'.($self->name);
  return $values->$has ? 1 : 0;
}

sub get_result_by_values {
  my ( $self, $values ) = @_;
  return unless $self->has_result_by_values($values);
  my $name = $self->name;
  return $self->get_result_by_value($values->$name);
}

sub get_result_by_value {
  my ( $self, $value ) = @_;
  return $value;
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::Process - Role for processed fields

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
