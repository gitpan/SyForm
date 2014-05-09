package SyForm::Results::Object;
BEGIN {
  $SyForm::Results::Object::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Functionality for SyForm::Results to deliver a Moose object
$SyForm::Results::Object::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

has object => (
  is => 'ro',
  isa => 'Moose::Object',
  lazy_build => 1,
);

sub _build_object {
  my ( $self ) = @_;
  return $self->syform->fields_object_class->new($self->as_hashref);
}

1;

__END__

=pod

=head1 NAME

SyForm::Results::Object - Functionality for SyForm::Results to deliver a Moose object

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
