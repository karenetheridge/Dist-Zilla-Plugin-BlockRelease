use strict;
use warnings FATAL => 'all';

use Test::More;
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';
use Test::DZil;
use Path::Tiny;
use Test::Fatal;

my $tzil = Builder->from_config(
    { dist_root => 't/does-not-exist' },
    {
        add_files => {
            path(qw(source dist.ini)) => simple_ini(
                [ GatherDir => ],
                [ BlockRelease => ],
                [ FakeRelease => ],
            ),
            path(qw(source lib Foo.pm)) => "package Foo;\n1;\n",
        },
    },
);

is(
    exception { $tzil->build },
    undef,
    'build proceeds normally',
);

like(
    exception { $tzil->release },
    qr{\[BlockRelease\] halting release},
    'release halts',
);

done_testing;
