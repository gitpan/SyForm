package SyForm::Fields;
BEGIN {
  $SyForm::Fields::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Fields::VERSION = '0.005';
use Moose::Role;
use namespace::autoclean;

sub as_hashref {
  my ( $self ) = @_;
  my %hashref;
  for my $name (@{$self->field_names}) {
    my $has = 'has_'.$name;
    $hashref{$name} = $self->$name if $self->$has;
  }
  return { %hashref };
}

has field_names => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Fields

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
