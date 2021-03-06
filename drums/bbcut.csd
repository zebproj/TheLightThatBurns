<CsoundSynthesizer>
<CsOptions>
-d
-odac:system:playback_ -B 2048
-+rtaudio=jack
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	96000
;sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1
seed 01232

instr 1	
adrumL, adrumR diskin2 "drum_plain.wav", 1, 0, 1
ibps = 172/60
acutL bbcutm adrumL, ibps, 64, 4, 2, 1, 1, 0.4, 1
acutR bbcutm adrumL, ibps, 64, 4, 2, 1, 1, 0.4, 1


acutL = acutL * (2^16)
acutL = acutL | (2 ^ 12)
acutL = acutL / (2^16)
acutL = acutL * 1
acutL buthp acutL, 500
acutL clip acutL, 0, 0.5

acutR = acutR * (2^16)
acutR = acutR | (2 ^ 12)
acutR = acutR / (2^16)
acutR = acutR * 1
acutR buthp acutR, 500
acutR clip acutR, 0, 0.5


outs acutL, acutR

endin

</CsInstruments>
; ==============================================
<CsScore>
t 0 172
i1 0 [4 * 16] 

</CsScore>
</CsoundSynthesizer>

