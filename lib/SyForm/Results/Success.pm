package SyForm::Results::Success;
BEGIN {
  $SyForm::Results::Success::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT:
$SyForm::Results::Success::VERSION = '0.007';
use Moose::Role;
use namespace::autoclean;

# use MooseX::Role::WithOverloading;
# use overload q{bool} => sub { $_[0]->success };

has success => (
  is => 'ro',
  isa => 'Bool',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Results::Success - $SyForm::Results::Success::VERSION = '0.007';

=head1 VERSION

version 0.007

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
