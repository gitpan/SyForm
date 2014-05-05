package SyForm::Meta::Attribute::Field;
BEGIN {
  $SyForm::Meta::Attribute::Field::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for SyForm fields meta attributes
$SyForm::Meta::Attribute::Field::VERSION = '0.008';
use Moose::Role;
use namespace::clean -except => 'meta';

has field => (
  is => 'ro',
  isa => 'SyForm::Field',
  required => 1,
  handles => [qw(
    syform
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Meta::Attribute::Field - Role for SyForm fields meta attributes

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
