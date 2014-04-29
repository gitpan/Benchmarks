package Benchmarks;
use strict;
use warnings;
use Benchmark qw//;

our $VERSION = '0.02';

sub import {
    my ($class, $code, $count) = @_;

    Benchmark->export_to_level(1, $class, ':all');

    if ($code && ref $code eq 'CODE') {
        Benchmark::cmpthese( Benchmark::timethese( $count || -1, $code->() ) );
    }
}

1;

__END__

=head1 NAME

Benchmarks - The comparison benchmarker


=head1 SYNOPSIS

    use Benchmarks sub {
        my $x = 2;
        +{
            times => sub { $x * $x * $x * $x },
            raise => sub { $x ** 4 },
        };
    };


=head1 DESCRIPTION

B<Benchmarks> is the L<Benchamark> wrapper for comparing routines easily.

When this module was loaded, all you need to do is pass the CODE reference that returns hash reference.

    use Benchmarks sub {
        +{
            'routine_name_1' => sub { '... some code ...' },
            'routine_name_2' => sub { '... some code ...' },
        };
    };

Then the comparison will be invoked and show the result like below.

    Benchmark: running raise, times for at least 1 CPU seconds...
         raise: -1 wallclock secs ( 1.07 usr +  0.00 sys =  1.07 CPU) @ 8895180.37/s (n=9517843)
         times:  2 wallclock secs ( 1.10 usr +  0.00 sys =  1.10 CPU) @ 4051316.36/s (n=4456448)
               Rate times raise
    times 4051316/s    --  -54%
    raise 8895180/s  120%    --

NOTE that C<Benchmarks> exports *ALL* functions from C<Benchmark>. You can use C<Benchmarks> module as same as Benchmark module.

    use Benchmarks;

    timethis (-1, sub { bless +{}, 'Foo' } );

More information about functions: L<https://metacpan.org/pod/Benchmark#Standard-Exports> and L<https://metacpan.org/pod/Benchmark#Optional-Exports>


=head1 REPOSITORY

Benchmarks is hosted on github
L<http://github.com/bayashi/Benchmarks>

Welcome your patches and issues :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Benchmark>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
