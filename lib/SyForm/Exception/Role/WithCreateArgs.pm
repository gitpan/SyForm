package SyForm::Exception::Role::WithCreateArgs;
BEGIN {
  $SyForm::Exception::Role::WithCreateArgs::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for exceptions around the create process
$SyForm::Exception::Role::WithCreateArgs::VERSION = '0.009';
use Moose::Role;

has create_args => (
  is => 'ro',
  isa => 'ArrayRef',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithCreateArgs - Role for exceptions around the create process

=head1 VERSION

version 0.009

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
