default:

tracks=break_tracks plucked_tracks pad_tracks intro_tracks convolved_tracks\
	ambient_tracks

files=rough_mix.wav bigmix.wav

break_tracks: 
	cd drums; make all

plucked_tracks:
	cd leads; make all

clean_plucked_tracks:
	cd leads; make clean

pad_tracks:
	cd pads; make all

intro_tracks: 
	cd intro; make intro_cross.wav

convolved_tracks:
	cd convolve; make all;

ambient_tracks:
	cd ambience; make all;

all:
	make ${tracks}

everything:
	make all
	#make render

clean:
	rm ${files}

clean_all: 
	cd intro; make clean
	cd leads; make clean
	cd pads; make clean
	cd drums; make clean
	cd convolve; make clean
	cd ambience; make clean
	
render: makemixer.pl
	perl makemixer.pl > mixer.ecs
	ecasound mixer.ecs
play:
	mplayer -ao jack rough_mix.wav
mix:
	perl makemixer.pl > mixer.ecs
	ecasound -c mixer.ecs	
