<CsoundSynthesizer>
<CsOptions>
-d
-B 2048
-odac:system:playback_
-+rtaudio=jack
;-+rtaudio=alsa
-+rtmidi=alsa
--midi-key-pch=4
;--midi-velocity-amp=5
</CsOptions>
<CsInstruments>
sr	=	96000
;sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1
giwave ftgen 0, 0, 256, 1, "../waveforms/cycle_3.wav", 0, 0, 1
instr 1
ipch = cpspch(p4)
iamp = p5 

aenv expsegr 0.0001, 0.001, 1, 0.6, 0.0001, 0.01, 0.0001
kfilt_env linseg 1, 0.4, 0
a1 oscili iamp, ipch, giwave
a1 butlp a1, 100 + ipch * kfilt_env

a1 = a1 * aenv


outs a1, a1

endin

</CsInstruments>
<CsScore>
i1 0 4 7.00 1

</CsScore>
</CsoundSynthesizer>

