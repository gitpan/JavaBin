package JavaBin;
# ABSTRACT: Apache Solr JavaBin (de)serializer

require DynaLoader;

$VERSION = .4;

DynaLoader::bootstrap('JavaBin');

sub dl_load_flags { 0 }

sub import {
    *{ caller() . '::from_javabin' } = \&from_javabin;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

JavaBin - Apache Solr JavaBin (de)serializer

=head1 VERSION

version 0.4

=head1 SYNOPSIS

 use JavaBin;

 my $result = from_javabin $binary_data;

=head1 DESCRIPTION

JavaBin is a compact binary format used by L<Apache Solr|http://lucene.apache.org/solr>.

For more information on this format see the L<Solr Wiki|http://wiki.apache.org/solr/javabin>.

This package provides a deserializer for this format, with a serializer planned.

=head1 FUNCTIONS

=head2 from_javabin

 my $result = from_javabin $binary_data;

Accepts one argument, a binary string of containing the JavaBin.

Returns a scalar representation of the data, be that undef, number, string, or reference.

This function does no error checking, hand it invalid JavaBin and it will probably die.

=head1 DATA TYPE MAPPING

Java data types are mapped to Perl ones as follows.

=head2 null

A null is returned as L<undef>.

=head2 Booleans

True and false are returned as 1 and 0 respectively.

=head2 Byte, short, double, int, and long.

Integers of all size are returned as scalars, with the requirement of a 64bit Perl for longs.

=head2 Float

A float is returned as a scalar, with the requirement of a 64bit Perl for large values.

=head2 Date

A date is returned as a string in ISO 8601 format. This may change to be a Date object like L<DateTime> in future.

=head2 Map

A map is returned as a hash.

=head2 Iterator

An iterator is flattened into an array.

=head2 String

All strings are returned as strings with the UTF-8 flag on.

=head2 Array

An array is returned as an array.

=head2 SimpleOrderedMap

A SimpleOrderedMap is returned as an array. This will likely change to be a tied hash like L<Tie::IxHash> in future.

=head2 NamedList

A NamedList is returned as an array. This will likely change to be a tied hash or object in future.

=head1 TODO

=over 4

=item *

C<to_javabin> serializer.

=back

=head1 INSPIRATION

This package was inspired by the L<Ruby JavaBin library|https://github.com/kennyj/java_bin>.
Both that library and the Java JavaBin library proved very helpful in understanding JavaBin.

=head1 AUTHOR

James Raspass <jraspass@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by James Raspass <jraspass@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
