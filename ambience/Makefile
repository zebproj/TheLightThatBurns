objects = chatter.wav outrochat.wav reverbchat.wav conv_chat.wav low_groan.wav\
		low_groan_octave.wav high_groan.wav high_groan_reverb.wav impulse.wav

default:

chatter.wav: chatter.sco chatter.orc
	csound -o chatter.wav -W -d  chatter.orc chatter.sco

chatter.sco: genscore.py
	python genscore.py > chatter.sco

outrochat.wav: outrochat.sco chatter.orc
	csound -o outrochat.wav -W -d  chatter.orc outrochat.sco
outrochat.sco: outrochat.py
	python outrochat.py > outrochat.sco

reverbchat.wav: outrochat.wav reverbsc.csd
	./reverb -r 96000 -o reverbchat.wav -i outrochat.wav -p 0.6 -e 10 -c 10000 -d .98	

impulse.wav: impulse.sco chatter.orc
	csound -d -oimpulse.wav -W chatter.orc impulse.sco

conv_chat.wav: impulse.wav outrochat.wav
	./convolve -s outrochat.wav -i impulse.wav -o conv_chat.wav -p 0.2

low_groan.wav: timestretcher
	./timestretcher -i ../thelightthatburns.wav -o low_groan.wav -s 16 -z 8192\
		-p 0.25
low_groan_octave.wav: timestretcher
	./timestretcher -i ../thelightthatburns.wav -o low_groan_octave.wav -s 16 -z 8192\
		-p 0.5
high_groan.wav: timestretcher
	./timestretcher -i ../thelightthatburns.wav -o high_groan.wav -s 16 -z 8192\
		-p 3
high_groan_reverb.wav: high_groan.wav reverb
	./reverb -r 96000 -o high_groan_reverb.wav -i high_groan.wav -p .8 -e 10 -c 10000 -d .98	

all:
	make ${objects}

clean:
	rm ${objects}

