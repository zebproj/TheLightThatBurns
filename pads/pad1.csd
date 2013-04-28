<CsoundSynthesizer>
<CsOptions>
-d
-odac:system:playback_
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

giwave ftgen 0, 0, 256, 1, "../waveforms/cycle_3.wav", 0, 0, 1

instr 1	
ipch = cpspch(p4)
iamp = 1 
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

</CsInstruments>
; ==============================================
<CsScore>
f 0 999
t 0 85
i1 0 8 7.00
i1 0 8 8.00
i1 0 8 8.04
i1 0 8 8.07
</CsScore>
</CsoundSynthesizer>


