#!/usr/bin/perl

use 5.010;
use strict;

my $filename = 0;
my $impulse = 0;
my $extra_time = 0;
my $scale = 0.01;
my $sr = 96000;
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
	if ($c =~ /^s(.*)/){
		$filename = $1;
	}elsif ($c =~ /^o(.*)/){
		$output = $1;
	}elsif ($c =~ /^i(.*)/){
		$impulse = $1;
	}elsif ($c =~ /^r(.*)/){
		$sr = $1;
	}elsif ($c =~ /^e(.*)/){
		$extra_time = $1;
	}elsif ($c =~ /^p(.*)/){
		$scale = $1;
	}
}
if($help){
print 	
	"Commands:\n".
	"-s FILE signal to be convolved \n".
	"-i FILE filename of impulse response \n".
	"-o FILE output filename \n".
	"-r sample rate\n".
	"-e append extra time (in seconds)\n".
	"-p scale (0 - 1)\n";
}elsif($output =~ /0/ or $filename =~ /0/ or $impulse =~ /0/){
	print "ERROR: you must specificy a signal, impulse, and output filename".
	"with the -s, -i, and -o flags, respectively.";
}else{
	open TEMP, ">tmp.csd";
	select TEMP;
print
"<CsoundSynthesizer>
<CsOptions>
-o$output
</CsOptions>
; ==============================================
<CsInstruments>

sr		=	$sr
ksmps	=	1
nchnls	=	2
0dbfs	=	1


instr 1
ilen filelen \"$filename\"
p3 = ilen + $extra_time
a1,a2 diskin2 \"$filename\", 1

idur filelen \"$impulse\"
idel = ceil(idur * kr)/kr
awetL,awetR pconvolve a1, \"$impulse\"
outs awetL*$scale, awetR*$scale
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 4 
</CsScore>
</CsoundSynthesizer>
";

close TEMP;

system("csound tmp.csd");

unlink "tmp.csd";

}
