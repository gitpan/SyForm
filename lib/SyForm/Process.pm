package SyForm::Process;
BEGIN {
  $SyForm::Process::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Role for processed fields
$SyForm::Process::VERSION = '0.002';
use Moose::Role;
use Moose::Meta::Class;
use Moose::Meta::Attribute;
use SyForm::Exception::UnknownErrorOnProcess;
use namespace::autoclean;

#################
#
# Meta Attribute
#
#################

has meta_attributes_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);

sub _build_meta_attributes_class {
  my ( $self ) = @_;
  return $self->_meta_attributes_metaclass->name;
}

has _meta_attributes_metaclass => (
  isa => 'Moose::Meta::Class',
  is => 'ro',
  lazy_build => 1,
);

sub _build__meta_attributes_metaclass {
  my ( $self ) = @_;
  return Moose::Meta::Class->create_anon_class(
    superclasses => ['Moose::Meta::Attribute'],
    roles => [
      'SyForm::Meta::Attribute::Field', 'MooseX::Traits',
      @{$self->_meta_attributes_metaclass_roles},
    ],
  )
}

has _meta_attributes_metaclass_roles => (
  isa => 'ArrayRef[Str]',
  is => 'ro',
  lazy => 1,
  default => sub {[]},
);

#########
#
# Values
#
#########

has values_base_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);
sub _build_values_base_class { 'Moose::Object' }

has values_roles => (
  isa => 'ArrayRef[Str]',
  is => 'ro',
  lazy => 1,
  default => sub {[]},
);

sub _get_values_meta_attribute {
  my ( $self, $field, %args ) = @_;
  return $self->meta_attributes_class->new($field->name,
    is => 'ro',
    predicate => 'has_'.$field->name,
    field => $field,
    %args,
  );
}

has _values_metaclass => (
  isa => 'Moose::Meta::Class',
  is => 'ro',
  lazy_build => 1,
);

sub _build__values_metaclass {
  my ( $self ) = @_;
  return Moose::Meta::Class->create_anon_class(
    superclasses => [$self->values_base_class],
    roles => [
      'SyForm::Values', 'MooseX::Traits',
      @{$self->values_roles},
    ],
    attributes => [map {
      $self->_get_values_meta_attribute($_);
    } @{$self->process_fields}],
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
# Results
#
##########

has results_base_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);
sub _build_results_base_class { 'Moose::Object' }

has results_roles => (
  isa => 'ArrayRef[Str]',
  is => 'ro',
  lazy => 1,
  default => sub {[]},
);

sub _get_results_meta_attribute {
  my ( $self, $field, %args ) = @_; 
  return $self->meta_attributes_class->new($field->name,
    is => 'ro',
    predicate => 'has_'.$field->name,
    field => $field,
    %args,
  );
}

has _results_metaclass => (
  isa => 'Moose::Meta::Class',
  is => 'ro',
  lazy_build => 1,
);

sub _build__results_metaclass {
  my ( $self ) = @_;
  return Moose::Meta::Class->create_anon_class(
    superclasses => [$self->results_base_class],
    roles => [
      'SyForm::Results', 'MooseX::Traits',
      @{$self->results_roles},
    ],
    attributes => [map {
      $self->_get_results_meta_attribute($_);
    } @{$self->process_fields}],
  )
}

has results_class => (
  isa => 'Str',
  is => 'ro',
  lazy_build => 1,
);

sub _build_results_class {
  my ( $self ) = @_;
  return $self->_results_metaclass->name;
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
  return [grep {
    $_->does($self->field_process_role)
  } $self->fields->Values];
}

sub process {
  my @process_args = @_;
  my ( $self, %args ) = @_;
  my $results;

  eval {
    my %values_args;
    for my $field (@{$self->process_fields}) {
      if ($field->has_value_by_args(%args)) {
        $values_args{$field->name} = $field->get_value_by_args(%args);
      }
    }
    my $values = $self->create_values(%values_args);
    my %results_args;
    for my $field (@{$self->process_fields}) {
      if ($field->has_result_by_values($values)) {
        $results_args{$field->name} = $field->get_result_by_values($values);
      }
    }
    $results = $self->create_results($values, %results_args);
  };

  SyForm::Exception::UnknownErrorOnProcess->throw($self,[@process_args],$@) if ($@);

  return $results;
}

sub create_values {
  my ( $self, %args ) = @_;
  return $self->values_class->new({
    syform => $self, %args
  });
}

sub create_results {
  my ( $self, $values, %args ) = @_;
  return $self->results_class->new({
    values => $values, %args
  });
}

1;

__END__

=pod

=head1 NAME

SyForm::Process - Role for processed fields

=head1 VERSION

version 0.002

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
