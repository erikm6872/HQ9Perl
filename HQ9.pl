use 5.010;
use strict;
use warnings;
use Switch;


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
    
#Print header
say "***************************************";
say "         HQ9Perl Interpreter";
say "         by Erik McLaughlin";
say "      http://github.com/erikm6872";
say "***************************************";

#Process each line of the file separately
while(my $row = <$fh>){
	chomp $row;
    
    #Convert line string to char array
	my @chars = split //, $row;
    
    #Process each char
    foreach my $cmd (@chars) {
        switch($cmd) {
            
            # The interpreter accepts the characters H, Q, 9, and + as commands.
            # H: Prints "Hello World!"
            # Q: Prints the entire text of the source code file
            # 9: Prints the complete canonical lyrics to "99 Bottles of Beer on the Wall"
            # +: Increments the accumulator. I have no idea what this actually means, so it does nothing.

            case "H"{ 
                say "Hello World!";
            }
            case "Q"{
                
                #Quine Functionality
                #Open the input file again and print everything in it.
                open(my $fh, '<:encoding(UTF-8)', $fileName)
                    or die "Could not open file '$fileName' $!";
                while(my $row = <$fh>){
                    chomp $row;
                    say $row;
                }
            }
            case "9"{
                
                #Print 99 Bottles of Beer
                #Start loop at 99 and go down
                for (my $i=99; $i > 0; $i--) {
                    if ($i == 1) {
                        say "$i bottle of beer on the wall";
                        say "$i bottle of beer";
                    }
                    else{
                        say "$i bottles of beer on the wall";
                        say "$i bottles of beer";
                    }
                    say "Take one down, pass it around";
                    
                    #Declaring a new variable is easier to print
                    my $minOne = $i-1;
                    if ($minOne == 1) {
                        say "$minOne bottle of beer on the wall\n";
                    }
                    else{
                        say "$minOne bottles of beer on the wall\n";
                    }
                }
            }
            case "+"{
                #Increments the accumulator. Again, this variable serves no purpose.
                $accum = $accum + 1; 
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
}