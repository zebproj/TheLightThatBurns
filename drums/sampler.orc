sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

giwave ftgen 0, 0, 0, 1, "../waveforms/cycle_1.wav", 0, 0, 1

instr 1 ;hihat
iamp = p4
Sfile = "../waveforms/noise_2.wav"
iscale = 1/0.7
kscram randh 6, sr/2
a1 diskin Sfile, abs(kscram), 0, 1
a1 = a1 * iscale
ilen = 0.03
aenv linseg 0.0001, 0.01, 1, ilen - 0.01, 0.0001
a1 buthp a1, 2000
irand random 0.4, 1
outs a1*aenv*iamp*irand, a1 * aenv * iamp * irand
endin

instr 2	;kick 
icps = 75
iamp = p4
ilen = 0.6

agate expsegr iamp, 0.01, 0.001

kdrop expseg icps, ilen, 20
kenv expseg 1, ilen, 0.0001
iamp = .6
;a1 oscil iamp, kdrop, giwave
a1 loscil iamp, kdrop, giwave, 500, 1
a1 = a1 * kenv
a1 distort1 a1, 2, iamp, 0.1, 0.1 

icar = 1
imod = 1
indx = 400
iamp_click = 0.2
ifreq = 50

aclikenv expseg 1, 0.1, 0.001

amod loscil3 ifreq*imod*indx, imod * ifreq, giwave, 500, 1
kmod downsamp amod
acar loscil3 iamp_click, (ifreq * icar) + kmod, giwave, 500, 1
acar = aclikenv * acar
acar buthp acar, 500

aL = a1 + acar
aL clip aL, 1, 1
aL = aL * agate
aR = aL 

outs aL, aR
endin

instr 3	;snare
iamp = p4
Sfile = "../waveforms/noise.wav"
iscale = 1/0.7
imix = 0.4
irand random -0.003, 0.003
a1 diskin Sfile, 1.05 + irand
a1 = a1 * iscale
ilen = 0.2
iatk = p5
aenv expseg 0.00001, iatk, 1, ilen, 0.001
a1 buthp a1, 200
arev reverb a1, 0.9
a1 = (arev * imix) + (a1 * (1 - imix))
agate linsegr 1, 0.3, 0.001
irandamp random 0.8, 1
iamp = iamp * irandamp
outs a1 * aenv * agate * iamp, a1 * aenv * agate * iamp
endin
