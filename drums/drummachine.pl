use 5.010;

open DRUM, "<$ARGV[0]";
open SCO, ">$ARGV[1]";
select SCO;
$n = 0;
$offset = 0;
$tempo = 86 * 2;
printf( "t 0 $tempo\n");
$bars = ((60/$tempo) * 8)/96000;
@macro = qw(hihat kick snare);
foreach $i (1..3){
	print "#define $macro[$i - 1] #$i#\n";
}

$step = 0.25;
$step_number = 16;
$snare_atk = 0.0001;
while(<DRUM>){
	if($_ =~ /^\n$/){
		next;	
	}elsif($_ =~ /D=(\w)/){
		$step = 1.0/$1;
	}elsif($_ =~ /STEPS=(\w)/){
		$step_number = $1;
	}elsif($_ =~ /SNARE_ATK=(\w)/){
		$snare_atk = $1/100.0;
	}else{
		chomp $_;
		$time = 0 + $offset;
		#$drumline = "* . . . * . . . * . . . * . . .";
		$drumline = $_;
		$instr = $macro[$n];
		@line = split (' ', $drumline);
		foreach $i (@line){
			if ($i =~ /\*/){
				print "i\$$instr\t$time\t$step\t";
				#hihat randomization
				if($n == 0){
					$amp = 0.1 + rand(0.4);
					print "$amp\n";
				}elsif($n == 2){
					print "0.5\t$snare_atk\n";	
				}else{
					print "0.5\n";
				}
			}
			$time += $step;
		}
		if($n == scalar(@macro - 1)){
			$n = 0;
			$offset += $step * $step_number
		}else{
			$n++;
		}
	}
}
close SCO;
