package SyForm::Exception::Role::WithSyFormField;
BEGIN {
  $SyForm::Exception::Role::WithSyFormField::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::Role::WithSyFormField::VERSION = '0.003';
use Moose::Role;

has field => (
  is => 'ro',
  does => 'SyForm::Field',
  required => 1,
  handles => [qw(
    syform
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithSyFormField

=head1 VERSION

version 0.003

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
