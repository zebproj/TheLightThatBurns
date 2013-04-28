sr	=	96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1
ginoise ftgen 0, 0, 4096, 1, "../waveforms/noise_2.wav", 0, 0, 1

instr 1	
ipch = cpspch(p4)
iamp = p5 
kenv linseg 1, p3, 0
a1 pluck iamp * kenv, ipch, ipch, ginoise, 6
outs a1, a1
endin

