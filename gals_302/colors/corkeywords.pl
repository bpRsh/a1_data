#!/usr/bin/perl
use POSIX;
$doprint = 1;
$doproc = 1;
$fitsfile = shift @ARGV;

$ms = 0;
open(CF,$fitsfile);
while($cdat = <CF>) {
    chomp($cdat);
    chomp($nx = `stats -v N1 < $cdat`);
    chomp($ny = `stats -v N2 < $cdat`);
    if($nx > $ms) {
	$ms = $nx;
    }
    if($ny > $ms) {
	$ms = $ny;
    }
}
close(CF);
open(CF,$fitsfile);
while($cdat = <CF>) {
    chomp($cdat);
    chomp($nx = `stats -v N1 < $cdat`);
    chomp($ny = `stats -v N2 < $cdat`);

    $dx = floor(($nx - $ms) / 2);
    $dy = floor(($ny - $ms) / 2);
    &esystem("makesubimage $dx $dy $ms $ms -o < $cdat > temp.fits");
    
    &esystem("ic -h PIXSCALE 0.03 -h MAG0 30 '%1' temp.fits > $cdat");
 
}


sub esystem{
    if ($doprint) {
	print "$_[0]\n";
    }
    if ($doproc) {
        system($_[0]);
    }
}
