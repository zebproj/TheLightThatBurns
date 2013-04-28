<CsoundSynthesizer>
<CsOptions>
-owordfreeze.wav
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	96000
ksmps	=	1
nchnls	=	2
0dbfs	=	1

#define SCALE #3#

instr 100
ifftsize = 1024
ioverlap = ifftsize/4
iwinsize = ifftsize
iwinshape = 1
Sfile1 = "../thelight_mono.wav"
ain diskin2 Sfile1, 1
fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
freeze pvsfreeze fftin, 0, 0
aout pvsynth freeze
	outs aout, aout
endin

instr 1

ifftsize = 1024
ioverlap = ifftsize/4
iwinsize = ifftsize
iwinshape = 1
Sfile1 = "../thelight_mono.wav"
ain soundin Sfile1
gkamp_1 init 0
gkfreq_1 init 0
fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
freeze pvsfreeze fftin, gkamp_1, gkfreq_1
aout pvsynth freeze
	outs aout/$SCALE, aout/$SCALE

endin

instr 2
gkamp_1 = 1
gkfreq_1 = 1
endin

instr 3
ifftsize = 1024
ioverlap = ifftsize/4
iwinsize = ifftsize
iwinshape = 1
Sfile1 = "../thelight_mono.wav"
ain soundin Sfile1
gkamp_2 init 0
gkfreq_2 init 0
fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
freeze pvsfreeze fftin, gkamp_2, gkfreq_2
aout pvsynth freeze
ipan = p4
aoutL, aoutR pan2 aout, ipan
	outs aoutL/$SCALE, aoutR/$SCALE
endin

instr 4
gkamp_2 = 1
gkfreq_2 = 1
endin

instr 5

ifftsize = 1024
ioverlap = ifftsize/4
iwinsize = ifftsize
iwinshape = 1
Sfile1 = "../thelight_mono.wav"
ain soundin Sfile1
gkamp_3 init 0
gkfreq_3 init 0
fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
freeze pvsfreeze fftin, gkamp_3, gkfreq_3
aout pvsynth freeze
ipan = p4
aoutL, aoutR pan2 aout, ipan
	outs aoutL/$SCALE, aoutR/$SCALE
endin

instr 6
gkamp_3 = 1
gkfreq_3 = 1
endin

instr 7

ifftsize = 1024
ioverlap = ifftsize/4
iwinsize = ifftsize
iwinshape = 1
Sfile1 = "../thelight_mono.wav"
ain soundin Sfile1
gkamp_4 init 0
gkfreq_4 init 0
fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
freeze pvsfreeze fftin, gkamp_4, gkfreq_4
aout pvsynth freeze
ipan = p4
aoutL, aoutR pan2 aout, ipan
	outs aoutL/$SCALE, aoutR/$SCALE
endin

instr 8
gkamp_4 = 1
gkfreq_4 = 1
endin

</CsInstruments>
; ==============================================
<CsScore>
i100 0 5

i1 0 40 0
i2 2.8 1

i3 0 40 1
i4 0.8 1

i5 0 40 0.25
i6 1.64 1

i7 0 40 0.75
i8 2.29 1


</CsScore>
</CsoundSynthesizer>
