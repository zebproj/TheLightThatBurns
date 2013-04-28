objects = pad1.wav pad_mix.wav  padreverb.wav pad_intro_reverb.wav pad_intro.wav \
		pad_intro_mix.wav twiceasbright_vocoded.wav twiceasbright_3.wav
default:

pad_mix.wav: pad1.wav padreverb.wav
	sox -m pad1.wav padreverb.wav pad_mix.wav
pad1.sco: pad.xm 
	xm2sco -i pad.xm -o pad1.sco -t
padreverb.wav: pad1.wav
	./reverb 96000 padreverb.wav pad1.wav 0.2 10 10000 .98	
pad1.wav: pad.orc pad1.sco
	csound -d -opad1.wav pad.orc pad1.sco

pad_intro_mix.wav: pad_intro.wav pad_intro_reverb.wav
	sox -m pad_intro.wav pad_intro_reverb.wav pad_intro_mix.wav
pad_intro.wav: pad.orc pad_intro.sco
	csound -d -opad_intro.wav pad.orc pad_intro.sco
pad_intro.sco: pad_intro.xm 
	xm2sco -i pad_intro.xm -o pad_intro.sco -t

pad_intro_reverb.wav: pad_intro.wav reverbsc.csd
	./reverb 96000 pad_intro_reverb.wav pad_intro.wav 0.2 10 10000 .98	


#timestretched snippet from intro
twiceasbright_3.wav:
	cd ../intro; make twiceasbright_3.wav; 
	cp ../intro/twiceasbright_3.wav .
	sox twiceasbright_3.wav temp.wav norm 0
	mv temp.wav twiceasbright_3.wav

twiceasbright_vocoded.wav: twiceasbright_3.wav padreverb.wav vocoder.csd
	csound vocoder.csd

all:
	make ${objects}

clean:
	rm ${objects}


