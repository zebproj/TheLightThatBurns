<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ==============================================
<CsInstruments>

;define arguments here
/*
#define CUTOFF #15000#
#define DECAY #0.99#
#define SR #44100#
#define SCALE #0.15#
#define EXTRA_TIME #10#
*/

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

