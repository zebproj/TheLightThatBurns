sr = 44100
ksmps = 1
nchnls = 1
0dbfs = 1
objects = pad1.wav
default:

pad_mix.wav: pluck1.wav reverb1.wav
	sox -m pad1.wav padreverb.wav pad_mix.wav
pad1.sco: pad.xm 
	xm2sco -i pad.xm -o pad1.sco -t
pad1.wav: pad.orc pad1.sco
	csound -d -opad1.wav pad.orc pad1.sco
reverb1.wav: pad1.wav
	./reverb 96000 padreverb.wav pad1.wav 0.2 10 10000 .98	
clean:
	rm ${objects}


ÿ