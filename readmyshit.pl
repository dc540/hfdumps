#!/usr/bin/perl

$num_args = $#ARGV + 1;
print "$num_args args passed\n";
if ($num_args) { 
  for ($x=0; $x<$num_args; $x++) {
    $myfn = $ARGV[$x];
    print "Processing file: $myfn\n";
    processCard($myfn, $x);
  };
} else {
  print "No files provided\n\n";
};

sub processCard {
  my ($thisCard, $cardNum) = @_;
  print "Processing $thisCard...\n";
  open CARD, "$thisCard" or die $!;
  $bh0=<CARD>;
  print "Card $cardNum Block 0 header: \n  $bh0";
  $bh01=<CARD>;
  chomp;
  print "  $bh01";
  $bh02=<CARD>;
  chomp;
  print "  $bh02";
  $y=0;
  for ($y=1; $y<16; $y++) {
    $header=<CARD>;
    print "Card $cardNum Block $y:";
    $keya=substr($header,0,12);
    $accessBits=substr($header,12,8);
    $keyb=substr($header,20,12);
    # print "$header";
    print "KEYS: (A)$keya : (B)$key (Access Bits)$accessBits";
    $data0=<CARD>;
    $data1=<CARD>;
    $data2=<CARD>;
    if (($data0 != '00000000000000000000000000000000') or ($data1 != '00000000000000000000000000000000') or ($data2 != '00000000000000000000000000000000')) {
      print "\n  " . $data0;
      print "  " . $data1;
      print "  " . $data2;
      print "";
    } else {
      print " (all zeroes, no data)\n";
    };
    $thisblock=$block[$y];
    $thisata=$data[$y];
  };
  return;
};
