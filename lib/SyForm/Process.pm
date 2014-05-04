package SyForm::Process;
BEGIN {
  $SyForm::Process::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for processed fields
$SyForm::Process::VERSION = '0.007';
use Moose::Role;
use Moose::Meta::Class;
use Moose::Meta::Attribute;
use List::MoreUtils qw( uniq );
use namespace::autoclean;

#########
#
# Values
#
#########

has values_object_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);
sub _build_values_object_class { $_[0]->object_class }

has values_roles => (
  isa => 'ArrayRef[Str]',
  is => 'ro',
  lazy => 1,
  default => sub {[]},
);

has _values_metaclass => (
  isa => 'Moose::Meta::Class',
  is => 'ro',
  lazy_build => 1,
);

sub _build__values_metaclass {
  my ( $self ) = @_;
  return Moose::Meta::Class->create(
    (ref $self).'::Values',
    superclasses => [$self->values_object_class],
    roles => [ 'SyForm::Values' ],
  );
}

has values_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);

sub _build_values_class {
  my ( $self ) = @_;
  return $self->_values_metaclass->name;
}

##########
#
# Process
#
##########

has process_fields => (
  is => 'ro',
  isa => 'ArrayRef[SyForm::Field]',
  lazy_build => 1,
);

sub _build_process_fields {
  my ( $self ) = @_;
  return [grep { $_->does($self->field_process_role) } $self->fields->Values];
}

sub process {
  my @process_args = @_;
  my ( $self, %args ) = @_;
  my $view;
  eval { $view = $self->process_view(%args) };
  SyForm->throw( UnknownErrorOnProcess => $self,[@process_args], $@ ) if $@;
  return $view;
}

#################
#
# Process Values
#
#################

sub process_values {
  my @process_values_args = @_;
  my ( $self, %args ) = @_;
  my $values;
  eval {
    my %values_args;
    my @values_traits;
    for my $field (@{$self->process_fields}) {
      my %field_values_args = $field->values_args_by_process_args(%args);
      push @values_traits, @{delete $field_values_args{roles}}
        if defined $field_values_args{roles};
      $values_args{$_} = $field_values_args{$_} for keys %field_values_args;
    }
    $values = $self->create_values(
      roles => [uniq @values_traits],
      %values_args,
    );
  };
  SyForm->throw( UnknownErrorOnProcessValues => $self,[@process_values_args], $@ ) if $@;
  return $values;
}

sub create_values {
  my ( $self, %args ) = @_;
  my @traits = @{delete $args{roles}};
  my $values_as_hashref = delete $args{values_as_hashref};
  $args{field_names} = [map { $_->name } @{$self->process_fields}]
    unless defined $args{field_names};
  my %values;
  for (@{$args{field_names}}) {
    $values{$_} = delete $args{$_} if defined $args{$_};
  }
  return $self->values_class->new_with_traits({
    syform => $self,
    traits => [ @traits ],
    values => { %values },
    %args,
  });
}

##################
#
# Process Results
#
##################

sub process_results {
  my ( $self, %args ) = @_;
  my $results;
  my $results_as_hashref = delete $args{results_as_hashref};
  my $values = $self->process_values(%args);
  return $values->results;
}

###############
#
# Process View
#
###############

sub process_view {
  my ( $self, %args ) = @_;
  my $view;
  my $results = $self->process_results(%args);
  return $results->view;
}

1;

__END__

=pod

=head1 NAME

SyForm::Process - Role for processed fields

=head1 VERSION

version 0.007

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut