package SyForm::View::HTML;
BEGIN {
  $SyForm::View::HTML::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT:
$SyForm::View::HTML::VERSION = '0.010';
use Moose::Role;
use namespace::clean -except => 'meta';

has render => (
  is => 'ro',
  isa => 'Str',
  lazy_build => 1,
);

sub _build_render {
  my ( $self ) = @_;
  my $html = '<form>'."\n";
  for my $key ($self->syform->fields->Keys) {
    if (defined $self->fields->{$key}) {
      $html .= $self->fields->{$key}->render;
    }
  }
  $html .= '</form>';
  return $html;
}

1;

__END__

=pod

=head1 NAME

SyForm::View::HTML - $SyForm::View::HTML::VERSION = '0.010';

=head1 VERSION

version 0.010

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
