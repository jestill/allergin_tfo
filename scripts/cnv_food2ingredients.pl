#!/usr/bin/perl -w
# Convert the food data to list format

#use Getopt::Std;               # Allows options flags at command line
use Getopt::Long;

my $infile;
my $outfile;

my $ok = GetOptions(# OPTIONS
		    "i|infile=s"  => \$infile,
		    "o|outfile=s" => \$outfile,
    );

# INFILE
if ($infile) {
    open (TXTIN, "<$infile");
}
else {
    print STDERR "Waiting for input from STDIN\n";
    open (TXTIN, "<&STDIN");
}

# OUTFILE
if ($outfile) {
    open (TXTOUT, ">$outfile");
} 
else {
    open (TXTOUT, ">&STDOUT");
}


while ( <TXTIN> ) {
    
    chomp;
    my @in_cols = split (/\,/, $_);
    
    print STDERR $_;
    print STDERR "\n";
    
}
