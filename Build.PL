
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Apache Solr JavaBin (de)serializer",
  "dist_author" => [
    "James Raspass <jraspass\@gmail.com>"
  ],
  "dist_name" => "JavaBin",
  "dist_version" => "0.3",
  "license" => "perl",
  "module_name" => "JavaBin",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Filter::cpp" => 0,
    "perl" => "5.01",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Test::More" => 0,
    "charnames" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
