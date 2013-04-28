objects=twiceasbright_2.wav wordfreeze.wav twiceasbright_1.wav twiceasbright_3.wav\
	   halfaslong_1.wav halfaslong_2.wav halfaslong_3.wav wordmix.wav intro_cross.wav\
	   out.pvx 

default:

wordfreeze.wav: freeze.csd
	csound freeze.csd

twiceasbright_1.wav: timestretch.sh
	sh timestretch.sh 96000 4096 4 2 \
		../Individual_Words/twiceasbright.wav twiceasbright_1.wav 0

twiceasbright_2.wav: timestretch.sh
	sh timestretch.sh 96000 4096 4 8 \
		../Individual_Words/twiceasbright.wav twiceasbright_2.wav 0

twiceasbright_3.wav: timestretch.sh
	sh timestretch.sh 96000 8192 8 16 \
		../Individual_Words/twiceasbright.wav twiceasbright_3.wav 0.5

halfaslong_1.wav: timestretch.sh
	sh timestretch.sh 96000 1024 1 0.5 \
		../Individual_Words/halfaslong.wav halfaslong_1.wav 0

halfaslong_2.wav: timestretch.sh
	sh timestretch.sh 96000 1024 1 0.25 \
		../Individual_Words/halfaslong.wav halfaslong_2.wav 0 

halfaslong_3.wav: timestretch.sh 
	sh timestretch.sh 96000 1024 1 0.125 \
		../Individual_Words/halfaslong.wav halfaslong_3.wav 0

wordmix.wav: word_sampler.csd wordfreeze.wav twiceasbright_1.wav twiceasbright_2.wav\
             twiceasbright_3.wav halfaslong_1.wav halfaslong_2.wav halfaslong_3.wav
	csound -owordmix.wav word_sampler.csd

../pads/pad_intro_mix.wav:
	cd ../pads; make pad_intro_mix.wav

intro_cross.wav: wordmix.wav pvscross.csd
	csound -ointro_cross.wav pvscross.csd
clean:
	rm ${objects}

all:
	make ${objects}
