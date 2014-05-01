package SyForm::Field::Process;
BEGIN {
  $SyForm::Field::Process::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for processed fields
$SyForm::Field::Process::VERSION = '0.001';
use Moose::Role;

has result => (
  is => 'rw',
  predicate => 'has_result',
  clearer => 'reset_result',
);

sub set_result {
  my ( $self, $value ) = @_;
  $self->result($value);
}

sub process {
  my ( $self, %args ) = @_;
  if (exists $args{$self->name}) {
    $self->set_result($args{$self->name});
  }
  return 1;
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::Process - Role for processed fields

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
