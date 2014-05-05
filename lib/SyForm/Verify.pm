package SyForm::Verify;
BEGIN {
  $SyForm::Verify::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Main verification logic
$SyForm::Verify::VERSION = '0.008';
use Moose::Role;
use namespace::clean -except => 'meta';

has verify_without_errors => (
  is => 'ro',
  isa => 'Bool',
  lazy => 1,
  default => sub { 0 },
);

has verify_filters => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  predicate => 'has_verify_filters',
);

has verify_process_fields => (
  is => 'ro',
  isa => 'ArrayRef[SyForm::Field]',
  lazy_build => 1,
);

sub _build_verify_process_fields {
  my ( $self ) = @_;
  return [grep { $_->does('SyForm::Field::Verify') } @{$self->process_fields}];
}

1;

__END__

=pod

=head1 NAME

SyForm::Verify - Main verification logic

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
