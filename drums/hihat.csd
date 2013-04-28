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
Sfile = "../waveforms/noise_2.wav"
iscale = 1/0.7
kscram randh 6, sr
a1 diskin Sfile, abs(kscram), 0, 1
a1 = a1 * iscale
ilen = 0.04
aenv linseg 0.0001, 0.01, 1, ilen - 0.01, 0.0001
a1 buthp a1, 2000
outs a1*aenv, a1 * aenv
endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 0.5

</CsScore>
</CsoundSynthesizer>

