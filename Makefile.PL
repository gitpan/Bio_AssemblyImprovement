
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Improve an assembly by scaffolding, contig ordering and gap closing.",
  "AUTHOR" => "Andrew J. Page <ap13\@sanger.ac.uk>",
  "BUILD_REQUIRES" => {
    "Test::Most" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bio_AssemblyImprovement",
  "EXE_FILES" => [
    "bin/abacas.pl",
    "bin/descaffold_assembly",
    "bin/fill_gaps_with_gapfiller",
    "bin/improve_assembly",
    "bin/order_contigs_with_abacas",
    "bin/scaffold_with_sspace"
  ],
  "LICENSE" => "gpl",
  "NAME" => "Bio_AssemblyImprovement",
  "PREREQ_PM" => {
    "Bio::SeqIO" => 0,
    "Cwd" => 0,
    "File::Basename" => 0,
    "File::Copy" => 0,
    "File::Path" => "2.07",
    "File::Temp" => 0,
    "File::Which" => 0,
    "Getopt::Long" => 0,
    "Getopt::Std" => 0,
    "IO::Uncompress::Gunzip" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "POSIX" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.123530",
  "test" => {
    "TESTS" => "t/Abacas/*.t t/FillGaps/*.t t/Overall/*.t t/Scaffold/*.t"
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



