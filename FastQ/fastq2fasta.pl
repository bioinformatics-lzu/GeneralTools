#! /usr/bin/env perl
# author: wangkun
use strict;
use warnings;

my ($fastq,$fasta)=@ARGV;

die "Usage: $0 <fastq file> <fasta file>\n" if(!$fastq || !$fasta);

open(I,"< $fastq")||die "Cannot open $fastq!\n";
open(O,"> $fasta")||die "Cannot create $fasta!\n";
my $light=0;
while (<I>) {
    if(/^\@(.*)/){
        $light=1;
        print O ">$1\n";
        next;
    }
    elsif(/^\+/){
        $light=0;
        next;
    }
    if($light==1){
        print O "$_";
    }
}
close I;
