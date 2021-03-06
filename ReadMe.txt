Paul Batchelor
SoundByte Draft 3
DSP Class

================
INTRODUCTION
================

"The Light That Burns" is a composition that uses a single Blade Runner quote,
put through various kinds of DSP techniques to create a wide range of sounds.


================
DSP Breakdown
================

0:00: Time manipulation of words and phrases using the phase vocoder. Speed 
adjustments were made using sample playback.

0:41: 

1. Drums. The kick was made from a pitch shifted single cycle loop from the 
"O" sound in "long." The snare and hihat both utilize small bits of sounds from 
the word "twice." 

2. Pads: the pad sounds you hear in the background was made using a single cycle 
loop from the "O" sound in "long." Reverb and filter control was added for 
more depth.

3. Lead: The lead uses noise from the word "twice" as a wavetable in a karplus-
strong instrument in Csound. 

4. Chatter: If you listen closely, you will hear fragments of the quote and 
random time intervals and positions in the stereo field.

0:58: 

The original quote is convolved with the lead-sounding instrument 
playing the main theme, acting as something like an echo.

1:16:

More of the convolved echo effect previously mentioned is heard, this time with
the B theme of the song.

1:26:

1. BBcut: A simple drum loop (created using the previously mentioned instruments)
is stuttered using the bbcut opcode in csound, one for each speaker channel. It 
is then processed and distorted.

2. Vocoded Reverb: the main quote is convolved with the reverb from the pad, 
which creates the wind sound you hear.

1:39:

Pluckspeech: Another melodic idea using the karplus strong instrument is convolves the 
quote. This output is then reversed. 

1:48:

Using a single cycle loop from the "O" sound in the word "long", an arpeggiating
instrument is created. It is heavily filtered to create a sinusoidal-like sound.

2:00:

Chatter: random portions of the original quote are taken in small bites and put
in random parts of the stereo field. Playback speed is also randomly varied. 

Convolved chatter: The chatter mentioned above is convolved by the original 
quote put through an exponential envelope. This creates a mumbling sensation.

2:08:
"groans" begin. Here, the original quote has been pitch shifted and 
time-stretched three separate times and layered together.

Reverb is also added for depth.

2:30:
Modified pluckspeech: the convolved speech heard at 1:39 is time stretched and
reverb is added. This is what causes the singing sound heard at the very end.


================
Compilation
================

Before compilation, you must make sure your system has the following software  
installed:

GNU Make
Perl
Python
Csound
SOX

To compile, simply go into the main directory directory and run the command:

"make everything"

If successful, this will generate the assets needed for the Ardour session file,
which is where the song was arranged and mixed.

To clean everything, run the command:

"make clean_all" 

If you do not do a clean "make everything", you may have to remove files manually
