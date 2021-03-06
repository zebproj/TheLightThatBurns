<CsoundSynthesizer>
<CsOptions>
-d
-odac:system:playback_
-+rtaudio=jack
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	96000
;sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1



instr 1	
iamp = p5

ichan filenchnls "halfaslong_1.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "halfaslong_1.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "halfaslong_1.wav", p4

output:
a1, a2 pan2 a1, p7
outs a1 * iamp, a2 * iamp
endin
	
instr 2	
iamp = p5

ichan filenchnls "halfaslong_2.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "halfaslong_2.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "halfaslong_2.wav", p4

output:
a1, a2 pan2 a1, p7
outs a1 * iamp, a2 * iamp
endin
	
instr 3	
iamp = p5

ichan filenchnls "halfaslong_3.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "halfaslong_3.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "halfaslong_3.wav", p4

output:
a1, a2 pan2 a1, p7
outs a1 * iamp, a2 * iamp
endin
	
instr 4	
iamp = p5

ichan filenchnls "twiceasbright_1.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "twiceasbright_1.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "twiceasbright_1.wav", p4

output:
a1, a2 pan2 a1, p7
outs a1 * iamp, a2 * iamp
endin
	
instr 5	
iamp = p5

ichan filenchnls "twiceasbright_2.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "twiceasbright_2.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "twiceasbright_2.wav", p4

output:
a1, a2 pan2 a1, p7
outs a1 * iamp, a2 * iamp
endin
	
instr 6	
iamp = p5

ichan filenchnls "twiceasbright_3.wav"
print ichan

if ichan == 2 goto stereo
a1 diskin2 "twiceasbright_3.wav", p4, p6, 1
a2 = a1
goto output

stereo:
a1, a2 diskin2 "twiceasbright_3.wav", p4, p6, 1

output:
outs a1 * iamp, a2 * iamp
endin
	
instr 7	
iamp = p5

ichan filenchnls "wordfreeze.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "wordfreeze.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "wordfreeze.wav", p4

output:
outs a1 * iamp, a2 * iamp
endin
	

</CsInstruments>
; ==============================================
<CsScore>
#define voices #7#
#define long_3 #6#
#define long_2 #5#
#define long_1 #4#
#define half_3 #3#
#define half_2 #2#
#define half_1 #1#
;a 0 0 20 
;Initial Drones
i$voices	0	40	1	1	0
i$long_3	6	36	-0.5	1	0
i$long_3	13	45	-0.25	2	0

;Twice as bright, twice as slow
i$long_1	8	2	1	2	0	0.9
;half as long, half as long
i$half_1	10	2	1	3	0	0.1

;Twice as bright, twice as slow
i$long_2	13	8	1	2	0	0.9
;half as long, half as long
5
i$half_2	17	.5	1	3	0	0.1
i$half_2	17.5	.5	1	3	0	0.1
i$half_2	18	.5	1	3	0	0.1
i$half_2	18.5	.5	1	3	0	0.1

i$long_3	20	20	1	1	0
i$half_3	20	.11	5	3	0	0.9
i$half_3	+	.11	4	3	0	0.1
i$half_3	+	.11	3	3	0	0.9
i$half_3	+	.11	2	3	0	0.1
i$half_3	+	.11	1	3	0	0.9
i$half_3	+	.11	1	3	0	0.1
i$half_3	+	.2	0.5	3	0	0.9
i$half_3	+	.2	0.4	3	0	0.1
i$half_3	+	.2	0.3	3	0	0.9
i$half_3	+	.2	0.2	3	0	0.1
i$half_3	+	.2	0.1	3	0	0.9

</CsScore>
</CsoundSynthesizer>

