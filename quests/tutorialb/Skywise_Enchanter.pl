sub EVENT_SAY {
	 my $ulevel = plugin::val('ulevel');
	 my $client = plugin::val('client');
	 #:: Match test for hail, case insensitive
	 if ($text=~/hail/i)  {
		  $client->Message( 18, "Skywise Enchanter says to you, 'Welcome! Would you like me to " . quest::saylink("buff") . " you?'")
	 }
     #:: Match text for buff, case insensitive
     elsif ($text=~/buff/i) {
          #:: Responce to buff
 		  $client->Message( 18, "Skywise Enchanter says to you, 'I can do that! Are you " . quest::saylink("64 and under", 1) . " or " . quest::saylink("65 and higher", 1) . "?'")
     }
	 elsif ($text=~/64 and under/i) {
		  #:: Success Message
		  $client->Message( 18, "Skywise Enchanter says to you, 'Enjoy! Come back later if they wear off... Or you die'");
		  #:: Set buff list
		  foreach my $buffs ( 3692, 154, 158, 159, 156, 157, 1570, 145, 172, 1693, 2524, 13 ) {
			  #::Call buff list and cast
			  quest::selfcast($buffs);
			  }
	 }
	 elsif ($text=~/65 and higher/i) {
		  #::Level Check
		  if ($ulevel > 64) {
			  #:: Set buff list
			  foreach my $buffs ( 36221, 14284, 34246, 35459, 34267, 34988, 36221, 30219, 3444, 2524, 36221, 34246, 35459, 40116, 13, 34985 ) {
				  #::Call buff list and cast
				  quest::selfcast($buffs);
			  }
		  } else { 
			  #:: Send Failure Message
			  $client->Message( 18, "Skywise Enchanter says to you, 'These buffs are too powerful for you, $name. Check to make sure you meet the level requirements.'")
		  }
	 }
}