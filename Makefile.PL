
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'export shared globs with Sub::Exporter collectors',
  'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.96'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Sub-Exporter-GlobExporter',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Sub::Exporter::GlobExporter',
  'PREREQ_PM' => {
    'Scalar::Util' => '0',
    'Sub::Exporter' => '0'
  },
  'VERSION' => '0.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



