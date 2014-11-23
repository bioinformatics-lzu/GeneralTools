#! /usr/bin/env perl
# author: wangkun
use strict;
use warnings;

my ($fastq,$fasta)=@ARGV;

die "Usage: $0 <fastq file> <fasta file>\n" if(!$fastq || !$fasta);

open(I,"< $fastq")||die "Cannot open $fastq!\n";
open(O,"> $fasta")||die "Cannot create $fasta!\n";
my $count=0;
while (<I>) {
    chomp;
    if(/^\@(\S+)/){
        my $name=$1;
        print O ">$name\n";
        $count=0;
        next;
    }
    if(/^\+$/){
        while ($count-->0) {
            <I>;
        }
        next;
    }
    print O "$_\n";
    $count++;
}
close I;
