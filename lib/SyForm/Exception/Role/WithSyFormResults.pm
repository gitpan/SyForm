package SyForm::Exception::Role::WithSyFormResults;
BEGIN {
  $SyForm::Exception::Role::WithSyFormResults::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Exception::Role::WithSyFormResults::VERSION = '0.007';
use Moose::Role;

has results => (
  is => 'ro',
  does => 'SyForm::Results',
  required => 1,
  handles => [qw(
    syform
  )],
);

1;

__END__

=pod

=head1 NAME

SyForm::Exception::Role::WithSyFormResults

=head1 VERSION

version 0.007

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut