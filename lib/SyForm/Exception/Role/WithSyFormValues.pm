package SyForm::Exception::Role::WithSyFormValues;
BEGIN {
  $SyForm::Exception::Role::WithSyFormValues::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for exceptions with a SyForm::Values
$SyForm::Exception::Role::WithSyFormValues::VERSION = '0.009';
use Moose::Role;

has values => (
  is => 'ro',
  does => 'SyForm::Values',
  required => 1,
  handles => [qw(
    syform
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithSyFormValues - Role for exceptions with a SyForm::Values

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
