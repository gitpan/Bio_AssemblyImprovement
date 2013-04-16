package Bio::AssemblyImprovement::Util::FastqCleanupRole;
# ABSTRACT: Role for cleaning up a fastq file where the reads are not paired (i.e get rid of orphans)

use Moose::Role;
use Bio::SeqIO;


sub _remove_orphans {
  
    my ( $self, $input_filename) = @_;
	return undef unless(defined($input_filename));
	
	my %read_names_with_length;
	
    if ( $input_filename =~ /\.fq$/ || $input_filename =~ /\.fastq$/  ) {
    	my $fastq_obj =  Bio::SeqIO->new( -file => $input_filename , -format => 'Fastq');
      	while(my $seq = $fastq_obj->next_seq()){    	
      		# Read the file in pairs and throw away ones that do not have a partner
      		# This assumes that the reads are ordered and follow a /1, /2 sequence
      	}
      	
      	return \%read_names_with_length;
    }
    else {
        return undef; # Error message/throw exception? Does not look like a fastq file from the file extension
    }
}


no Moose;
1;

__END__

=pod

=head1 NAME

Bio::AssemblyImprovement::Util::FastqCleanupRole - Role for cleaning up a fastq file where the reads are not paired (i.e get rid of orphans)

=head1 VERSION

version 1.131060

=head1 SYNOPSIS

Reads in fastq file

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
