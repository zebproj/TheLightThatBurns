<CsoundSynthesizer>
<CsOptions>
-otwiceasbright_vocoded.wav
;-odac:system:playback_ -+rtaudio=jack  -B 2048
</CsOptions>
; ==============================================
<CsInstruments>
/*
#define SR #44100#
#define FILENAME #"pad.wav"#
#define EXTRA_TIME #0#
#define MODFILE #"loop.wav"#
#define HICUT #300#
#define FFTSIZE #2048#
#define AMPSCALE #1#
#define FREQSCALE #1#
*/
sr		=	96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1

instr 1
ilen filelen "twiceasbright_3.wav"
p3 = ilen 
asig1 diskin2 "twiceasbright_3.wav", 1
asig2L, asig2R diskin2 "padreverb.wav", 1, 0, 1

iampscale =  0.5
ifreqscale = 14

ifftsize = 2048
ioverlap = ifftsize/8
iwinsize = ifftsize
iwinshape = 0

fsig1L 	pvsanal asig1,ifftsize,ioverlap,iwinsize,iwinshape
fsig2L 	pvsanal asig2L,ifftsize,ioverlap,iwinsize,iwinshape

fsig1R 	pvsanal asig1,ifftsize,ioverlap,iwinsize,iwinshape
fsig2R 	pvsanal asig2R,ifftsize,ioverlap,iwinsize,iwinshape

fvocL	pvsvoc	fsig1L, fsig2L, iampscale, ifreqscale
fvocR	pvsvoc	fsig1R, fsig2R, iampscale, ifreqscale

aoutL		pvsynth fvocL
aoutR		pvsynth fvocR

aoutL buthp aoutL, 1000
aoutR buthp aoutR, 1000

outs	aoutL * 5, aoutR * 5
endin

instr 2



endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 4 
</CsScore>
</CsoundSynthesizer>

