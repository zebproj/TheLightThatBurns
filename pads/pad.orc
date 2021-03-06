sr	=	96000
;sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1
giwave ftgen 0, 0, 256, 1, "../waveforms/cycle_3.wav", 0, 0, 1
instr 1	
ipch = cpspch(p4)
iamp = p5  * .3
agate linsegr 0, 0.1, 1, 2, 0
kenv linseg 0, 4, 1
a1 oscili iamp, ipch, giwave
a2 loscil3 iamp, ipch * .998, giwave, 260, 1
a3 loscil3 iamp, ipch * 1.004, giwave, 260, 1
a1 lpf18 a1, 1000 + 2000 * kenv, 0.1, 0
a2 lpf18 a1, 1000 + 2000 * kenv, 0.1, 0
a3 lpf18 a1, 1000 + 2000 * kenv, 0.1, 0

aL = a2 + (a1 * .5)
aR = a3 + (a1 * .5)

outs (aL + a1) * agate, (aR + a2) * agate
endin
