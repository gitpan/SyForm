package SyForm::Field::HTML;
BEGIN {
  $SyForm::Field::HTML::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: HTML attributes for the field
$SyForm::Field::HTML::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

has html => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has custom_input_attrs => (
  is => 'rw',
  isa => 'HashRef[Str]',
  default => sub {{}},
);

around viewfield_roles_by_results => sub {
  my ( $orig, $self, $results ) = @_;
  return $self->$orig($results), qw( SyForm::ViewField::HTML );
};

has html_name => (
  is => 'rw',
  isa => 'Str',
  lazy_build => 1,
);

sub _build_html_name {
  my ( $self ) = @_;
  return $self->name;
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::HTML - HTML attributes for the field

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
