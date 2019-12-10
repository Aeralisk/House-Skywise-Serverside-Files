sub EVENT_SAY {
	 #:: Match test for hail, case insensitive
	 if ($text=~/hail/i)  {
		  $client->Message( 18, "The Trainer says to you, 'Welcome! Would you like me to [" . quest::saylink("train") . "] you in your field, $name?'")
	 }
     #:: Match text for train, case insensitive
     elsif ($text=~/train/i) {
          #:: Call the custom subroutine "Train"
          Train();
     }
}

#:: Custom subroutine
sub Train {
     #:: Send a message to the client in yellow (15) text
     $client->Message( 15, "Your experiences across the realm have infused you with increased power and knowledge..." );
     #:: Set all available skills to maximum for race/class at current level
     foreach my $skill (0 .. 77) {
          #:: Continue the foreach loop using the next skill ID if the client cannot use the skill ID
          next unless $client->CanHaveSkill($skill);
          #:: Create a scalar variable to store the maximum skill Value for the Skill ID
          my $maxSkill = $client->MaxSkill($skill, $client->GetClass(), $ulevel);
          #:: Continue the foreach loop using the next Skill ID if the client has a higher skill Value for the Skill ID
          next unless $maxSkill > $client->GetRawSkill($skill);
          #:: Set the Skill ID to the maximum Value that the client is allowed
          $client->SetSkill($skill, $maxSkill);
     }
     #:: Scribe all spells for current level
     quest::scribespells($ulevel);
	 #:: Clear out any existing disciplines (optional)
	 quest::untraindiscs();
	 #:: Train all disciplines up to the user's level
	 quest::traindiscs($ulevel, 0);

	 #:: Perform the Forward Cast animation
	 quest::doanim(43);
}