package Bio::AssemblyImprovement::Validate::Executable;

# ABSTRACT: Validates the executable is available in the path before running it.


use Moose;
use File::Which;

sub does_executable_exist
{
  my($self, $exec) = @_;
  # if its a full path then skip over it
  return 1 if($exec =~ m!/!);

  my @full_paths_to_exec = which($exec);
  return 0 if(@full_paths_to_exec == 0);
  
  return 1;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=head1 NAME

Bio::AssemblyImprovement::Validate::Executable - Validates the executable is available in the path before running it.

=head1 VERSION

version 1.131890

=head1 SYNOPSIS

Validates the executable is available in the path before running it.

   use Bio::AssemblyImprovement::Validate::Executable;
   Bio::AssemblyImprovement::Validate::Executable
      ->new()
      ->does_executable_exist('abc');

=head1 METHODS

=head2 does_executable_exist

Check to see if an executable is available in the current users PATH.

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
