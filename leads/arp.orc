sr	=	96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1
giwave ftgen 0, 0, 256, 1, "../waveforms/cycle_3.wav", 0, 0, 1

gkfilt init 1

instr 1
ipch = cpspch(p4)
iamp = p5 

aenv expsegr 0.0001, 0.01, 1, 0.6, 0.0001, 0.01, 0.0001
kfilt_env linseg 1, 0.4, 0
a1 oscili iamp, ipch, giwave
a1 butlp a1, 30 + (ipch * kfilt_env )
a1 butlp a1, 1000 * gkfilt

a1 = a1 * aenv

outs a1, a1
endin

instr 2
gkfilt linseg p4, p3, p5
endin
