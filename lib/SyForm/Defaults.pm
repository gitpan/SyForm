package SyForm::Defaults;
BEGIN {
  $SyForm::Defaults::AUTHORITY = 'cpan:GETTY';
}
$SyForm::Defaults::VERSION = '0.001';
use Moose::Role;

around process => sub {
  my ( $orig, $self, %args ) = @_;
  for my $name ($self->fields->Keys) {
    my $field = $self->fields->FETCH($name);
    if ($field->does('SyForm::Field::Default')
      && $field->has_default && !exists $args{$name}) {
      $args{$name} = $field->default;
    }
  }
  return $self->$orig(%args);
};

1;

__END__

=pod

=head1 NAME

SyForm::Defaults

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
