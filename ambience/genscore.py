import random

tempo = 86
maxtime = 10 * 4 * (60.0/tempo)
iters = 80
time = 0
dur = 1
pitch = 1
position = 0.1
pan = 0.7

print("t 0 %i\n" % tempo)

for i in range(iters):
	time = random.random() * maxtime
	dur = random.random() * 3
	pitch = (random.random() * 0.75) + 0.25
	pitch = 1
	position = random.random()
	pan = random.random()
	print("i1\t%g\t%g\t%g\t%g\t%g\n" % (time, dur, pitch, position, pan))
