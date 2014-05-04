package SyForm::Exception::Role::WithSyForm;
BEGIN {
  $SyForm::Exception::Role::WithSyForm::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::Role::WithSyForm::VERSION = '0.006';
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

SyForm::Exception::Role::WithSyForm

=head1 VERSION

version 0.006

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
