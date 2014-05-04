package SyForm::Field::Label;
BEGIN {
  $SyForm::Field::Label::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: A label for a field
$SyForm::Field::Label::VERSION = '0.005';
use Moose::Role;
use namespace::autoclean;

has label => (
  is => 'ro',
  isa => 'Str',
  predicate => 'has_label',
);

1;

__END__

=pod

=head1 NAME

SyForm::Field::Label - A label for a field

=head1 VERSION

version 0.005

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
