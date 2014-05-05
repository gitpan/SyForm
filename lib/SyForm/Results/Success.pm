package SyForm::Results::Success;
BEGIN {
  $SyForm::Results::Success::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: A bool for holding the success of the form process
$SyForm::Results::Success::VERSION = '0.008';
use Moose::Role;
#use overload q{bool} => sub { $_[0]->success ? 1 : 0 }, fallback => 1;
use namespace::clean -except => 'meta';

has success => (
  is => 'ro',
  isa => 'Bool',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Results::Success - A bool for holding the success of the form process

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
