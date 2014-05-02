package SyForm::Exception::Role::WithOriginalError;
BEGIN {
  $SyForm::Exception::Role::WithOriginalError::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::Role::WithOriginalError::VERSION = '0.002';
use Moose::Role;

has original_error => (
  is => 'ro',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithOriginalError

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
