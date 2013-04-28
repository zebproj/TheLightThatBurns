#!/usr/bin/perl
use 5.010;
use strict;

my $FILENAME = 0;
my $EXTRA_TIME = 10;
my $SCALE = 0.5;
my $SR = 96000;
my $DECAY = .98;
my $CUTOFF = 10000;

my $output = 0;
my $help = 0;
my $cmdstring;


foreach my $a (@ARGV){
	$cmdstring .= $a;
}

my @commands = split '-',$cmdstring;

foreach my $c (@commands){
	if($c =~ /^h/){
		$help = 1;
	}
	if ($c =~ /^i(.*)/){
		$FILENAME = $1;
	}elsif ($c =~ /^o(.*)/){
		$output = $1;
	}elsif ($c =~ /^r(.*)/){
		$SR = $1;
	}elsif ($c =~ /^e(.*)/){
		$EXTRA_TIME = $1;
	}elsif ($c =~ /^p(.*)/){
		$SCALE = $1;
	}elsif ($c =~ /^d(.*)/){
		$DECAY = $1;
	}elsif ($c =~ /^c(.*)/){
		$CUTOFF = $1;
	}
}
if($help){
print 	
	"Commands:\n".
	"-s FILE signal to be convolved \n".
	"-o FILE output filename \n".
	"-r sample rate\n".
	"-e append extra time (in seconds)\n".
	"-p scale (0 - 1)\n".
	"-d decay (0 - 1)\n".
	"-c cutoff frequency\n";
}elsif($output =~ /0/ or $filename =~ /0/ or $impulse =~ /0/){
	print "ERROR: you must specificy a signal, impulse, and output filename".
	"with the -s, -i, and -o flags, respectively.";
}else{
	open TEMP, ">tmp.csd";
	select TEMP;
print
"<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	$SR	
ksmps	=	1
nchnls	=	2
0dbfs	=	1


instr 1
iamp = p5
ipch = cpspch(p4)
Sname = $FILENAME
ilen filelen Sname
p3 = ilen + $EXTRA_TIME 
a1,a2 diskin2 Sname, 1

agate linsegr $SCALE , p3, $SCALE , 1, 0

a1, a2 reverbsc a1, a2, $DECAY , $CUTOFF 

outs a1  * agate, a2 * agate
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 4 8.00 .5

</CsScore>
</CsoundSynthesizer>
";

close TEMP;

system("csound tmp.csd");

unlink "tmp.csd";

}

