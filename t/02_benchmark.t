use strict;
use warnings;
use Benchmarks;

timethis(100, sub { bless +{}, 'Foo' } );

use Test::More tests => 1;
ok 1;
