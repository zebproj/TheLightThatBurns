<CsoundSynthesizer>
<CsOptions>
-d
-odac:system:playback_
-+rtaudio=jack
;-+rtaudio=alsa
-+rtmidi=alsa
--midi-key-pch=4
;--midi-velocity-amp=5
-B 2048
</CsOptions>
; ==============================================
<CsInstruments>

;sr	=	44100
sr = 96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1

ginoise ftgen 0, 0, 4096, 1, "../waveforms/noise_2.wav", 0, 0, 1

instr 1	
ipch = cpsmidinn(p4)
iamp = .6
kenv linseg 1, p3, 0
a1 pluck iamp * kenv, ipch, ipch, ginoise, 6
outs a1, a1
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 1 59

</CsScore>
</CsoundSynthesizer>
 
