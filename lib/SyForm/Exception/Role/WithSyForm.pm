package SyForm::Exception::Role::WithSyForm;
BEGIN {
  $SyForm::Exception::Role::WithSyForm::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for exceptions with a SyForm instance as reference
$SyForm::Exception::Role::WithSyForm::VERSION = '0.009';
use Moose::Role;

has syform => (
  is => 'ro',
  does => 'SyForm',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithSyForm - Role for exceptions with a SyForm instance as reference

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
