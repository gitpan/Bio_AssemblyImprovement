
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Improve an assembly by scaffolding, contig ordering and gap closing.",
  "AUTHOR" => "Andrew J. Page <ap13\@sanger.ac.uk>",
  "BUILD_REQUIRES" => {
    "File::Slurp" => 0,
    "Test::File::Contents" => 0,
    "Test::Most" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bio_AssemblyImprovement",
  "EXE_FILES" => [
    "bin/abacas.pl",
    "bin/descaffold_assembly",
    "bin/diginorm_with_khmer",
    "bin/fastq_tools",
    "bin/fill_gaps_with_gapfiller",
    "bin/improve_assembly",
    "bin/order_contigs_with_abacas",
    "bin/read_correction_with_sga",
    "bin/remove_primers_with_quasr",
    "bin/rename_contigs",
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
    "IO::Compress::Gzip" => 0,
    "IO::Uncompress::Gunzip" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "POSIX" => 0,
    "Statistics::Lite" => 0,
    "Switch" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.133090",
  "test" => {
    "TESTS" => "t/Abacas/*.t t/Assemble/SGA/*.t t/DigitalNormalisation/Khmer/*.t t/FillGaps/*.t t/Overall/*.t t/PrepareForSubmission/*.t t/PrimerRemoval/*.t t/Scaffold/*.t t/Util/*.t"
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



