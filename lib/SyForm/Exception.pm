package SyForm::Exception;
BEGIN {
  $SyForm::Exception::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: SyForm base exception class
$SyForm::Exception::VERSION = '0.004';
use Moose;
extends 'Throwable::Error';

around throw => sub {
  my ( $orig, $class, $message, %args ) = @_;
  $class->$orig({
    message => '[SyForm Exception] '.$message, %args
  });
};

sub throw_with_args {
  my ( $class, $message ) = @_;
  $class->throw($message);
}

1;

__END__

=pod

=head1 NAME

SyForm::Exception - SyForm base exception class

=head1 VERSION

version 0.004

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
