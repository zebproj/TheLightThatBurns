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
ksmps	=	1
nchnls	=	2
0dbfs	=	1

instr 1	
Sfile = "../waveforms/noise.wav"
iscale = 1/0.7
imix = 0.4
a1 diskin Sfile, 1.05
a1 = a1 * iscale
ilen = 0.5
aenv expseg 1, ilen, 0.001
a1 buthp a1, 200
arev reverb a1, 0.9
a1 = (arev * imix) + (a1 * (1 - imix))
outs a1*aenv, a1 * aenv
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 0.5

</CsScore>
</CsoundSynthesizer>

