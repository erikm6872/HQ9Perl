use 5.010;
use strict;
use warnings;
use Switch;

#***************************************
#         HQ9Perl Interpreter
#          Erik C McLaughlin
#      http://github.com/erikm6872
#***************************************

#Print usage statement if no input file specified
my $numArgs = $#ARGV + 1;
if($numArgs != 1){
	say "Usage: perl HQ9+.pl filename";
	exit;
}

#Accumulator variable. This serves no purpose and cannot be accessed.
my $accum = 0;

#Set input filename variable
my $fileName = $ARGV[0];

#Try to open input file and throw an error if it's missing or otherwise can't be opened
say "Opening $fileName...\n";
open(my $fh, '<:encoding(UTF-8)', $fileName)
	or die "Could not open file '$fileName' $!";
    
#Process each line of the file separately
while(my $row = <$fh>){
	chomp $row;
    
    #Convert line string to char array
	my @chars = split //, $row;
    
    #Process each char
    foreach my $cmd (@chars) {
        my $output = parse($cmd);
		say $output;
    }
}
sub parse {
	my ($cmd) = @_;
	switch($cmd) {
            
            # The interpreter accepts the characters H, Q, 9, and + as commands.
            # H: Prints "Hello World!"
            # Q: Prints the entire text of the source code file
            # 9: Prints the complete canonical lyrics to "99 Bottles of Beer"
            # +: Increments the accumulator. I have no idea what this actually means, so it does nothing.
            
            case "H" {
            	#Print everybody's favorite phrase
                return hello();
            }
            case "Q" {
                return quine();
            }
            case "9" {
                #Print 99 Bottles of Beer lyrics
                #Start loop at 99 and go down
				return bottles();
            }
            case "+" {
                return accumulate();
            }
            #If a whitespace character is encountered, print error message and exit
            case " " {
                die("Error: Unknown keyword [whitespace]\n");  
            }
            #If any other character is encountered, print error message and exit
            else{
                die("Error: Unknown keyword $cmd\n");
            }
        }
}
sub hello {
	return "Hello World!\n";
}
sub quine {
	#Print the source code of the input file (Quine)
    #Open the input file again and print everything in it.
    open(my $fh, '<:encoding(UTF-8)', $fileName)
		or die "Could not open file '$fileName' $!";
	my $output = "";
    while(my $row = <$fh>){
        chomp $row;
        $output = $output . $row . "\n";
    }
	return $output;
}
sub bottles {
	#Print 99 Bottles of Beer lyrics
    #Start loop at 99 and go down
	
	my $output = "";
	
    for (my $i=99; $i > 0; $i--) {
        if ($i == 1) {
            $output = $output . "$i bottle of beer on the wall\n$i bottle of beer\n";
        }
        else{
            $output = $output . "$i bottles of beer on the wall\n$i bottles of beer\n";
        }
        $output = $output . "Take one down, pass it around\n";
        
        #Declaring a new variable is easier to print
        my $minOne = $i-1;
        if ($minOne == 1) {
            $output = $output . "$minOne bottle of beer on the wall\n\n";
        }
        else{
            $output = $output . "$minOne bottles of beer on the wall\n\n";
        }
    }
	return $output;
}
sub accumulate {
	#Increment the accumulator. Again, this variable serves no purpose and cannot be accessed in any way.
    $accum = $accum + 1;
	return "";
}