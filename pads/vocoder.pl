use 5.010;

if (scalar(@ARGV) == 0){
	print "USAGE: ".
	"vocoder carrier.wav modulator.wav output.wav hicut fftsize ampscale". 
	"freqscale extra_time";
}

$carrier = $ARGV[0];
$modulator = $ARGV[1];
$output = $ARGV[2];
$hicut = $ARGV[3];
$fftsize = $ARGV[4];
$ampscale = $ARGV[5];
$freqscale = $ARGV[6];
$extra_time = $ARGV[7];


print "csound -d -W -o$output --omacro:
