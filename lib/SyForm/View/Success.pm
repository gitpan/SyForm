package SyForm::View::Success;
BEGIN {
  $SyForm::View::Success::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT:
$SyForm::View::Success::VERSION = '0.004';
use Moose::Role;
use namespace::autoclean;

# TODO
# use MooseX::Role::WithOverloading;
# use overload q{bool} => 'success';

has success => (
  is => 'ro',
  isa => 'Bool',
  lazy_build => 1,
);

sub _build_success {
  my ( $self ) = @_;
  return $self->results->does('SyForm::Results::Success')
    ? $self->results->success
    : 1;
}

1;

__END__

=pod

=head1 NAME

SyForm::View::Success - $SyForm::View::Success::VERSION = '0.004';

=head1 VERSION

version 0.004

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
