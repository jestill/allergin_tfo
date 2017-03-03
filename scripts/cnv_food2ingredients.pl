#!/usr/bin/perl -w
# Convert the food data to list format

# usage as:
# cnv_food2ingredients.pl - infile.csv -outfile.csv
# ./cnv_food2ingredients.pl -i ../user_data/food_ingredient.tsv > ../user_data/ingredient_list.tsv

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
    my @in_cols = split (/\t/, $_);
    my $num_cols = @in_cols;

    # Get ingredients data from sixth column
    my $ingredient_col = $in_cols[5];
    my $len_ingredients = length($ingredient_col);
    my $food_name = $in_cols[1];
    
    # Only print output if we have ingredients listed for the food
    if ($len_ingredients > 0) {
	#print STDERR "\t".$ingredient_col."\n";

	# split ingredients list by comma
	my @ingredients = split (/,/, $ingredient_col);
	my $num_ingredients = @ingredients;
	print STDERR $food_name."\n";
	print STDERR "\tNum ingredients".$num_ingredients."\n";
	
	foreach my $ingredient (@ingredients) {

	    # remove any white spaces at beginning
	    $ingredient =~ s/^\s+//;
	    # remove any white spaces at the end
	    $ingredient =~ s/\s+$//;
	    # put name in lowercase
	    $ingredient = lc($ingredient);
	    
	    print STDERR "\t\t".$ingredient."\n";

	    # print result to output file
	    print TXTOUT $food_name."\t".$ingredient."\n";
	}

    }
    
}

