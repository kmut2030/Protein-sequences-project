#!/usr/bin/perl -w
my $plasmodb = "plasmodb.fa";
my $uniprot ="uniprot.fa";
my @uni;
my $join;
unless(open (UNIPROT, $uniprot)){
	print "Cant open file $uniprot\n";
}
@uni = <UNIPROT>;
#$uni = join('', @uni);
$uni = join('',@uni);
$uni =~ s/\s/-/g;
$uni =~ s/>/\n>/g;
@uni2 = split('\n',$uni);


close UNIPROT;

unless(open (PLASMODB, $plasmodb)){
	print "Cant open file $uniprot\n";
}
@plasmo = <PLASMODB>;
$plasmo = join('',@plasmo);
$plasmo =~ s/\s/-/g;
$plasmo =~ s/>/\n>/g;
@plasmo2 = split('\n',$plasmo);
 
$outputfile = "combine.fa";
open(COMBINE,">$outputfile");
for ($i=0; $i<=5; ++$i) {
 $join = $uni2[$i] . $plasmo2[$i];
 #$join =~ s/>P/\n>P/g;
 print COMBINE "$join\n";
}

exit;