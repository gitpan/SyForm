package SyForm::Fields;
BEGIN {
  $SyForm::Fields::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for SyForm::Values and SyForm::Results holding the fields
$SyForm::Fields::VERSION = '0.008';
use Moose::Role;
################ TODO
# use overload
#   q{%{}} => sub { use DDP; p($_[0]); 
#     $_[0]->as_hashref },
#   q{@{}} => sub {[ map {
#     $_[0]->as_hashref->{$_}
#   } keys %{$_[0]->as_hashref} ]};
use namespace::clean -except => 'meta';

requires 'as_hashref';

has field_names => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  required => 1,
);

1;

__END__

=pod

=head1 NAME

SyForm::Fields - Role for SyForm::Values and SyForm::Results holding the fields

=head1 VERSION

version 0.008

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
