use 5.010;

open DRUM, "<$ARGV[0]";
open SCO, ">$ARGV[1]";
select SCO;

#$string = "kick(0,1):		* * * *";
$tempo = 86 * 2;
printf( "t 0 $tempo\n");

@macro = qw(hihat kick snare);
foreach $i (1..3){
	print "#define $macro[$i - 1] #$i#\n";
}

while(<DRUM>){
	chomp $_;
	$string = $_;
	if($string =~ (/^\#/)){}
	elsif ($string =~ /(\w*)\((.*)\):(.*)/){
		$instr = $1;
		@vars = split (",", $2);
		$time = $vars[0];
		$step= 1.0/$vars[1];
		$grid_raw = $3;
		$grid_raw =~ s/\t//g;
		@grid = split (" ", $grid_raw);
		$instr =~ s/(\w*)_//g;
		$loop = $1; 
		if ($loop == undef){ 
			$loop = 1;
		}else{
			$vars[2] = int(($vars[2]/$loop) * 10000)/10000;
			$step = int(($step/$loop) * 10000)/10000;
		}
		foreach $i (@grid){
			if($i =~ /\*/){
				$micro_time = $time;
				foreach $x (1..$loop){
					print "i\$$instr\t$micro_time\t$step";
					if($loop == 1){
						foreach $v (2..scalar(@vars - 1)){
							print "\t$vars[$v]";
						}
					}else{
						print "\t".$vars[2] * (($loop + 1) - $x)."\t";
						foreach $v (3..(scalar(@vars - 1))){
							print "\t$vars[$v]";
						}
					}
					print "\n";
					$micro_time += $step;
				}
			}
			$time += $step;
		}
	}
}
