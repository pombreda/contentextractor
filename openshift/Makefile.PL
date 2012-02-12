use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'openshift',
    AUTHOR              => q{Ramiro Gómez <www@ramiro.org>},
    VERSION_FROM        => 'lib/openshift.pm',
    ABSTRACT            => 'Extract content from HTML documents',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'mit')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.3072,
        'Plack::Handler::Apache2' => 0.9985,
        'HTML::ContentExtractor' => 0.03,
        'Regexp::Common::URI::http' => 2010010201,
        'HTML::ResolveLink' => 0.05
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'openshift-*' },
);
