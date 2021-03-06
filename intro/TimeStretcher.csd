<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 96000
ksmps = 1
0dbfs  = 1 
nchnls = 1
/*
#define FILE #"../Individual_Words/twiceasbright.wav"#
#define STRETCH #4#
#define EXTRA #0#
*/
	instr 1

gSFile          =	$FILE
giStretch       =	$STRETCH           
idur  filelen   gSFile
p3 = idur*giStretch + $EXTRA
	
kpos  line      0,idur*giStretch,idur		
fsigL pvsfread  kpos,"out.pvx"

aoutL  pvsynth	fsigL			;resynthesise it
aoutR = aoutL

      outs	aoutL, aoutR
endin
</CsInstruments>
<CsScore>

i1 0 1

</CsScore>
</CsoundSynthesizer> 
