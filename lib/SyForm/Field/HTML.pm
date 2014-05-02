package SyForm::Field::HTML;
BEGIN {
  $SyForm::Field::HTML::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: HTML attributes for a field
$SyForm::Field::HTML::VERSION = '0.003';
use Moose::Role;
use namespace::autoclean;

has html => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has input_attrs => (
  is => 'rw',
  isa => 'HashRef[Str|ArrayRef[Str]]',
  lazy_build => 1,
);

sub _build_input_attrs {
  my ( $self ) = @_; 
  return {};
}

1;

__END__

=pod

=head1 NAME

SyForm::Field::HTML - HTML attributes for a field

=head1 VERSION

version 0.003

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
