package SyForm::Field::Default;
BEGIN {
  $SyForm::Field::Default::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: A default for the field
$SyForm::Field::Default::VERSION = '0.008';
use Moose::Role;
use namespace::clean -except => 'meta';

has default => (
  is => 'ro',
  predicate => 'has_default',
);

around has_value_by_args => sub {
  my ( $orig, $self, %args ) = @_;
  return 1 if $self->$orig(%args);
  return 1 if $self->has_default;
  return 0;
};

around get_value_by_process_args => sub {
  my ( $orig, $self, %args ) = @_;
  return $self->default if !exists($args{$self->name}) && $self->has_default;
  return $self->$orig(%args);
};

1;

__END__

=pod

=head1 NAME

SyForm::Field::Default - A default for the field

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
