package SyForm::View::Bootstrap;
BEGIN {
  $SyForm::View::Bootstrap::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: SyForm::View role for Bootstrap support
$SyForm::View::Bootstrap::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

around _build_viewfield_roles_for_all => sub {
  my ( $orig, $self ) = @_;
  return [ @{$self->$orig}, 'SyForm::ViewField::Bootstrap' ];
};

1;

__END__

=pod

=head1 NAME

SyForm::View::Bootstrap - SyForm::View role for Bootstrap support

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
