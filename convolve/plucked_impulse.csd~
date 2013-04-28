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
iamp = .7
kenv expseg 1, p3, 0.0001
aexcite oscili iamp*kenv, ipch, ginoise
a1 repluck 0.2, iamp * kenv, ipch, 0.1, 0.3, aexcite
a1 dcblock2 a1
outs a1, a1
endin

</CsInstruments>
; ==============================================
<CsScore>
t 0 86
i1	0	1	57
i1	1	1	64
i1	2	1	71
i1	3	1	45	
i1	4	5	33	

</CsScore>
</CsoundSynthesizer>
 
