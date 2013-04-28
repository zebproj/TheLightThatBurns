csound -otest.wav --omacro:FILENAME='"thelightthatburns.wav"'\
	--omacro:EXTRA_TIME=5\
	--omacro:IMPULSE='"impulse.wav"'\
	--omacro:SCALE=0.01\
	--omacro:SR=96000\
	convolve.csd
