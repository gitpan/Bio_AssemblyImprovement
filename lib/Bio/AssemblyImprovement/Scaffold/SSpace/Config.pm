package Bio::AssemblyImprovement::Scaffold::SSpace::Config;
# ABSTRACT: Create the config file thats used to drive SSpace


use Moose;

has 'input_files'     => ( is => 'ro', isa => 'ArrayRef', required => 1 );
has '_default_insert_size' => ( is => 'ro', isa => 'Int',      default => 300 );
has 'insert_size'     => ( is => 'rw', isa => 'Int',      required => 1 );
has 'output_filename' => ( is => 'rw', isa => 'Str',      default  => '_scaffolder.config' );

sub create_config_file {
    my ($self) = @_;
    
    if(!defined($self->insert_size) || $self->insert_size == 0 )
    {
      $self->insert_size($self->_default_insert_size);
    }

    my $input_file_names = join( ' ', @{ $self->input_files } );
    open( my $lib_fh, "+>", $self->output_filename );
    print $lib_fh "LIB " . $input_file_names . " " . $self->insert_size . " 0.3 FR";
    close($lib_fh);

    return $self;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Bio::AssemblyImprovement::Scaffold::SSpace::Config - Create the config file thats used to drive SSpace

=head1 VERSION

version 1.140300

=head1 SYNOPSIS

Create the config file thats used to drive SSpace

   use Bio::AssemblyImprovement::Scaffold::SSpace::Config;

   my $config_file_obj = Bio::AssemblyImprovement::Scaffold::SSpace::Config->new(
     input_files => ['abc_1.fastq', 'abc_2.fastq'],
     insert_size => 250
   )->create_config_file;

=head1 METHODS

=head2 create_config_file

Create a config file for SSpace.

=head1 SEE ALSO

=for :list * L<Bio::AssemblyImprovement::Scaffold::SSpace::Iterative>
* L<Bio::AssemblyImprovement::Scaffold::SSpace::Main>

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
