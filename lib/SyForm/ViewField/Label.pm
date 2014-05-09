package SyForm::ViewField::Label;
BEGIN {
  $SyForm::ViewField::Label::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Label ViewField for a Label Field
$SyForm::ViewField::Label::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

has label => (
  is => 'ro',
  isa => 'Str',
  lazy_build => 1,
);

sub _build_label {
  my ( $self ) = @_;
  return $self->field->label;
}

1;

__END__

=pod

=head1 NAME

SyForm::ViewField::Label - Label ViewField for a Label Field

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
