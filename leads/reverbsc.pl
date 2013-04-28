use 5.010;
use SoundPipe;

$SP_ARGS{"FILENAME"} = "pluck1.wav";

SoundPipe::SP_reverbsc("reverb.wav", %SP_ARGS);
