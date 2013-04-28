package SoundPipe;
sub SP_reverbsc{
	print "===================================\n";
	print "ReverbSC \n";
	print "===================================\n";

	my %SPARGS;
	
	my $name = shift(@_);
	my %UARGS = @_;
	
	my $csd = "$FILEPATH/reverbsc.csd"; #filepath of csd
	
	$SPARGS{"ID"} = 1;
	$SPARGS{"CUTOFF"} = 15000;
	$SPARGS{"DECAY"} = .98;
	$SPARGS{"SR"} = 44100;
	$SPARGS{"SCALE"} = 0.2;
	$SPARGS{"EXTRA_TIME"} = 10;
	$SPARGS{"FILENAME"} = "'\"$name\"'";


	#verify user arguments and warn if they don't exist

	while( ($key, $value) = each %UARGS){
		if(exists $SPARGS{"$key"}){
			$SPARGS{$key} = $value;	
		}else{
			print "Warning: \"$key\" is an unrecognized value.\n";
		}
	}
	
	while( ($key, $value) = each %SPARGS){
		$arg = "--omacro:$key=$value";
		push @cmdargs, $arg;
	}

	my $ID = $SPARGS{"ID"};
	my $filename;
	if($ID > 999){
		print "Warning: ID number too large! Changing to 0\n";
		$ID = 0;
	}

	if(!($name=~ /.wav$/)){
		print "Error: filename must have extension of .wav\n";
	}else{
		#remove extension
		$name =~ s{\.[^.]+$}{};

		if($name =~ /\d\d\d$/){
			print "ID ($ID) detected. replacing ID...";
			$name =~ s{\d\d\d$}{};
			$filename = sprintf("%s%03d.wav",$name,$ID);
			print "$filename\n";
		}else{
			print "ID not detected. Appending ID ($ID) to filename...";
			$filename = sprintf("%s%03d.wav",$name,$ID);
			print "$filename\n";
		}
	}
		print "\n\n";
		#my $err = system("csound -o$filename -d -W -ONULL @cmdargs $csd"); 
		system("csound -o$filename -d -W -ONULL @cmdargs $csd"); 
		print("csound -o$filename -d -W -ONULL @cmdargs $csd\n"); 
		open(REMOVE,">>remove.pipe");
		select REMOVE;
		print "$filename\n";
		select STDOUT;
		close REMOVE;
		undef @cmdargs;
		$name = $filename;
}
1;
