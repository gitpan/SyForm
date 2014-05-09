package SyForm::HTML;
BEGIN {
  $SyForm::HTML::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT:
$SyForm::HTML::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

around view_roles => sub {
  my ( $orig, $self ) = @_;
  return [ @{$self->$orig}, 'SyForm::View::HTML' ];
};

1;

__END__

=pod

=head1 NAME

SyForm::HTML - $SyForm::HTML::VERSION = '0.010';

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
