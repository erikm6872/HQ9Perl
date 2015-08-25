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

#Accumulator variable. This serves no purpose and cannot be accessed by the user.
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


while(my $row = <$fh>){
	chomp $row;
	my @chars = split //, $row;
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
                open(my $fh, '<:encoding(UTF-8)', $fileName)
                    or die "Could not open file '$fileName' $!";
                while(my $row = <$fh>){
                    chomp $row;
                    say $row;
                }
            }
            case "9"{
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
                $accum = $accum + 1; 
            }
            case " " {
                die("Error: Unknown keyword [whitespace]\n");
                
            }
            else{
                die("Error: Unknown keyword $cmd\n");
            }
        }
    }
}