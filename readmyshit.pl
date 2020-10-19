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
  print "Card $cardNum Sector 0 header: \n  $bh0";
  $isdata=0;
  $bh01=<CARD>;
  chomp;
  print "  $bh01";
  $bh02=<CARD>;
  chomp;
  print "  $bh02";
  if (($bh01 != '00000000000000000000000000000000') or ($bh02 != '00000000000000000000000000000000')) {
    $isdata=1;
  };
  $y=0;
  for ($y=1; $y<16; $y++) {
    $header=<CARD>;
    print "Card $cardNum Sector $y:";
    $keya=substr($header,0,12);
    $accessBits=substr($header,12,8);
    $keyb=substr($header,20,12);
    # print "$header";
    print "KEYS: (A)$keya : (B)$keyb (Access Bits)$accessBits";
    $data0=<CARD>;
    chomp $data0;
    $ascii0 = `echo "$data0" | xxd -r -p 2>&1`;
    $data1=<CARD>;
    chomp $data1;
    $ascii1 = `echo "$data1" | xxd -r -p 2>&1`;
    $data2=<CARD>;
    chomp $data2;
    $ascii2 = `echo "$data2" | xxd -r -p 2>&1`;
    if (($data0 != '00000000000000000000000000000000') or ($data1 != '00000000000000000000000000000000') or ($data2 != '00000000000000000000000000000000')) {
      $isdata=1;
      print "\n  " . $data0 . " (Asc: " . $ascii0 . ")\n";
      print "  " . $data1 . " (Asc: " . $ascii1 . ")\n";
      print "  " . $data2 . " (Asc: " . $ascii2 . ")\n";;
      print "";
    } else {
      print " (all zeroes, no data)\n";
    };
    #$thissector=$sector[$y];
    #$thisata=$data[$y];
  };
  if (!$isdata) {
    print "######## $thisCard: NO DATA BEYOND SECTOR ZERO BLOCK ZERO!\n";
  };
  return;
};
