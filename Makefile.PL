use ExtUtils::MakeMaker;

WriteMakefile(
      'BUILD_REQUIRES' => {
    'Scalar::Util' => '0',
    'Test::Fatal' => '0',
    'Test::More' => '0.96',
    'Tie::Array' => '0',
    'Tie::Scalar' => '0',
    'integer' => '0',
    'strict' => '0',
    'utf8' => '0',
    'warnings' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'PREREQ_PM' => {
    'DynaLoader' => '0'
  },
    CCFLAGS      => '-fno-stack-protector -Wall -Werror -Wextra',
    NAME         => 'JavaBin',
    VERSION_FROM => 'lib/JavaBin.pm',
);
