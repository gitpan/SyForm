package SyForm::Class;
BEGIN {
  $SyForm::Class::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: TODO
$SyForm::Class::VERSION = '0.009';
use Moose;
use namespace::clean -except => 'meta';


1;

__END__

=pod

=head1 NAME

SyForm::Class - TODO

=head1 VERSION

version 0.009

=head1 SYNOPSIS

  package MyApp::MyForm;

  use SyForm::Class;

  field_roles qw(
    MyApp::SyForm::FieldRole
  );

  # given to all fields on creation
  field_args
    custom_value => 2,
    other_custom => 2;

  values_roles qw(
    MyApp::SyForm::ValuesRole
  );

  # Results roles are given via Values role
  # and View roles are given via Results role
  # ViewField roles are given via Field role

  # Or directly set your own classes, which is not recommended!
  # use roles for this, please.
  # values_class qw( MyApp::SyForm::Values );
  # field_class qw( MyApp::SyForm::Field );

  field username => (
    required => 1,
    label => 'Your name',
  );
  
  field age => (
    decimal => 1,
    label => 'Your age',
  );

  field unchecked => (
    label => 'Unchecked',
  );

  has outside_value => (
    is => 'ro',
    required => 1,
  );

  field dynamic => sub {
    my ( $self ) = @_; # SyForm::Class object
    if ($self->outside_value > 5) {
      return
        label => 'That...'
        required => 1;
    }
    return label => 'Or this';
  };

Usage:

  my $thing = MyApp::MyForm->new;
  my $syform = $thing->syform; # if you need to
  my $view = $thing->process(%params);
  if ($view->success) {
    # ...
  }

=head1 DESCRIPTION

L<SyForm::Class> is a simple way to store the field definitions
and other form variables via a package level configuration. It is
not actually making your class a L<SyForm> class, it is just
holding the data and will supply a L<SyForm> on B<syform> and can
directly process args via B<process>.

=encoding utf8

=head1 SUPPORT

IRC

  Join #sycontent on irc.perl.org. Highlight Getty for fast reaction :).

Repository

  http://github.com/SyContent/SyForm
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/SyContent/SyForm/issues

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
