open DRUMS, "drum_files";
open PADS, "pad_files";
open CONV, "convolve_files";
open AMB, "ambience_files";
open LEAD, "leads_files";

while(<DRUMS>){
	chomp $_;
	unlink $_;
	print "$_\n";
	system("ln -s ../../../../../drums/$_ $_");
}

while(<PADS>){
	chomp $_;
	unlink $_;
	print "$_\n";
	system("ln -s ../../../../../pads/$_ $_");
}
while(<CONV>){
	chomp $_;
	unlink $_;
	print "$_\n";
	system("ln -s ../../../../../convolve/$_ $_");
}
while(<AMB>){
	chomp $_;
	unlink $_;
	print "$_\n";
	system("ln -s ../../../../../ambience/$_ $_");
}
while(<LEAD>){
	chomp $_;
	unlink $_;
	print "$_\n";
	system("ln -s ../../../../../leads/$_ $_");
}
