<CsoundSynthesizer>
<CsOptions>
-d
-odac:system:playback_
-Ma
-+rtaudio=jack
;-+rtaudio=alsa
-+rtmidi=alsa
--midi-key-pch=4
;--midi-velocity-amp=5
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	96000
;sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1

giwave ftgen 0, 0, 0, 1, "../waveforms/cycle_1.wav", 0, 0, 1

instr 1	
icps = 75
ilen = .5 
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
aR = aL

outs aL, aR
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 0.75

</CsScore>
</CsoundSynthesizer>

