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

/*

instr 1	
iamp = p5

ichan filenchnls "hihat.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "hihat.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "hihat.wav", p4

output:
outs a1 * iamp, a2 * iamp
endin
*/
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
/*	
instr 2	
iamp = p5

ichan filenchnls "kick.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "kick.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "kick.wav", p4

output:
outs a1 * iamp, a2 * iamp
endin
*/
instr 2	
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
/*	
instr 3	
iamp = p5

ichan filenchnls "snare.wav", p6
print ichan

if ichan == 2 goto stereo
a1 diskin2 "snare.wav", p4, p6
a2 = a1
goto output

stereo:
a1, a2 diskin2 "snare.wav", p4

output:
outs a1 * iamp, a2 * iamp
endin
*/
instr 3	
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
f 0 999
t 0 86

i2 0 1 1 .5 0
i2 + 1 1 .5 0

</CsScore>
</CsoundSynthesizer>

