sub EVENT_SAY {
	 #:: Match test for hail, case insensitive
	 if ($text=~/hail/i)  {
		  $client->Message( 18, "The blacksmith says to you, 'Greetings traveler. I am in charge of making various armors and weapons for the camp. I am able to create " . quest::saylink("cloth") . ", " . quest::saylink("leather") . ", " . quest::saylink("chain") . ", or " . quest::saylink("plate") . " armors. I can also forge " . quest::saylink("weapons") . ". Do you have any " . quest::saylink("questions") . " $name?'")
	 }
	 #:: Respond to cloth
	 elsif ($text=~/cloth/i) {
		  $client->Message( 18, "The blacksmith says to you, 'To make the cloth armor set, you must bring me a Lost Gloomingdeep Cloth piece, an armor plan, and 2 platinum coins. You can buy the plans from my apprentice here at the forge. You can hand them to me directly, and I will convert them into the armor you need.'")
	}
	#:: Respond to leather
	 elsif ($text=~/leather/i) {
		  $client->Message( 18, "The blacksmith says to you, 'To make the leather armor set, you must bring me a Lost Gloomingdeep Leather piece, an armor plan, and 2 platinum coins. You can buy the plans from my apprentice here at the forge. You can hand them to me directly, and I will convert them into the armor you need.'")
	}
	#:: Respond to leather
	 elsif ($text=~/chain/i) {
		  $client->Message( 18, "The blacksmith says to you, 'To make the chain armor set, you must bring me a Lost Gloomingdeep Chain piece, an armor plan, and 2 platinum coins. You can buy the plans from my apprentice here at the forge. You can hand them to me directly, and I will convert them into the armor you need.'")
	}
	#:: Respond to plate
	 elsif ($text=~/plate/i) {
		  $client->Message( 18, "The blacksmith says to you, 'To make the plate armor set, you must bring me a Lost Gloomingdeep Plate piece, an armor plan, and 2 platinum coins. You can buy the plans from my apprentice here at the forge. You can hand them to me directly, and I will convert them into the armor you need.'")
	}
	#:: Respond to questions
	 elsif ($text=~/questions/i) {
		  $client->Message( 18, "The blacksmith says to you, 'What would you like to know more about?' " . quest::saylink("Armor Links") . " | " . quest::saylink("Armor Plans") . " | " . quest::saylink("Weapons") . " ")
	}
	#:: Respond to armor links
	 elsif ($text=~/armor links/i) {
		  $client->Message( 18, "The blacksmith says to you, 'What armors would you like to see?' (1 for cloth, 2 for leather, 3 for chain, and 4 for plate) " . quest::saylink("1") . " | " . quest::saylink("2") . " | " . quest::saylink("3") . " | " . quest::saylink("4") . " ")
	}
	#:: Respond to Preview Cloth
	 elsif ($text=~/1/i) {
		  quest::itemlink(67124);
		  quest::itemlink(67122);
		  quest::itemlink(67126);
		  quest::itemlink(67123);
		  quest::itemlink(67125);
		  quest::itemlink(67127);
		  quest::itemlink(67121);
	}
	#:: Respond to Preview Leather
	 elsif ($text=~/2/i) {
		  quest::itemlink(67116);
		  quest::itemlink(67114);
		  quest::itemlink(67117);
		  quest::itemlink(67115);
		  quest::itemlink(67118);
		  quest::itemlink(67119);
		  quest::itemlink(67120);
	}
	#:: Respond to Preview Chain
	 elsif ($text=~/3/i) {
		  quest::itemlink(67107);
		  quest::itemlink(67110);
		  quest::itemlink(67108);
		  quest::itemlink(67112);
		  quest::itemlink(67111);
		  quest::itemlink(67113);
		  quest::itemlink(67109);
	}
	#:: Respond to Preview Plate
	 elsif ($text=~/4/i) {
		  quest::itemlink(67106);
		  quest::itemlink(67102);
		  quest::itemlink(67100);
		  quest::itemlink(67101);
		  quest::itemlink(67105);
		  quest::itemlink(67103);
		  quest::itemlink(67104);
	}
	#:: Respond to Armor Plans
	 elsif ($text=~/armor plans/i) {
		  $client->Message( 18, "The blacksmith says to you, 'Plans can be bought from my apprentice, Xiey.'")
	}
	#:: Respond to Weapons
	 elsif ($text=~/weapons/i) {
		  $client->Message( 18, "The blacksmith says to you, 'To make weapons, I need a Lost Gloomingdeep Plate piece, a weapon plan, and 2 platinum. Would you like to " . quest::saylink("preview them") . "?'")
	}
	#:: Respond to Preview the Weapons
	 elsif ($text=~/preview them/i) {
		  quest::itemlink(67128);
		  quest::itemlink(67130);
		  quest::itemlink(67131);
		  quest::itemlink(67132);
		  quest::itemlink(67129);
	}
}
sub EVENT_ITEM {
#:: Cloth Turn-ins
	#:: Chest
    if (plugin::check_handin(\%itemcount, 54234 => 1 , 147496 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a chest piece from those items.");
            quest::summonitem(67127);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Head
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147495 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a head piece from those items.");
            quest::summonitem(67124);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Legs
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147497 => 1)) {
        #:: Try to take 2 Platinum from the client
        if ($client->TakeMoneyFromPP(2000, 1)) {
			#::NPC Success Responce
            quest::say("I was able to make leg pieces from those items.");
            #:: Give a 54234 - Gloomingdeep Cloth Legs
            quest::summonitem(67126);
            #:: Grant experience
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Boots
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147498 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a set of sandles from those items.");
            quest::summonitem(67123);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Sleeves
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147499 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make sleeves from those items.");
            quest::summonitem(67125);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Wrist
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147500 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a wrist pieces from those items.");
            quest::summonitem(67121);
            quest::summonitem(67121);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Gloves
    elsif (plugin::check_handin(\%itemcount, 54234 => 1 , 147501 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a gloves from those items.");
            quest::summonitem(67122);		
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
#::Plate Turn-ins
	#:: Chest
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147496 => 1)) {
        #:: Try to take 2 Platinum from the client
        if ($client->TakeMoneyFromPP(2000, 1)) {
			#::NPC Success Responce
            quest::say("I was able to make a chest piece from those items.");
            #:: Give a 54234 - Gloomingdeep Plate Chest
            quest::summonitem(67106);
            #:: Grant experience
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Helmet
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147495 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make helmet from those items.");
            quest::summonitem(67103);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Legs
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147497 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make leg pieces from those items.");
            quest::summonitem(67105);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Boots
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147498 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a set of sandles from those items.");
            quest::summonitem(67102);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Sleeves
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147499 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make sleeves from those items.");
            quest::summonitem(67104);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Wrists
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147500 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a wrist pieces from those items.");
            quest::summonitem(67100);
            quest::summonitem(67100);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Gloves
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147501 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a helmet from those items.");
            quest::summonitem(67103);		
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
#:: Leather Turn-ins
	#:: Chest
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147496 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a chest piece from those items.");
            quest::summonitem(67120);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Head
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147495 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a head piece from those items.");
            quest::summonitem(67117);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Legs
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147497 => 1)) {
        #:: Try to take 2 Platinum from the client
        if ($client->TakeMoneyFromPP(2000, 1)) {
			#::NPC Success Responce
            quest::say("I was able to make leg pieces from those items.");
            #:: Give a 54234 - Gloomingdeep Cloth Legs
            quest::summonitem(67119);
            #:: Grant experience
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Boots
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147498 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a set of sandles from those items.");
            quest::summonitem(67116);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Sleeves
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147499 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make sleeves from those items.");
            quest::summonitem(67118);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Wrist
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147500 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a wrist pieces from those items.");
            quest::summonitem(67114);
            quest::summonitem(67114);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Gloves
    elsif (plugin::check_handin(\%itemcount, 86010 => 1 , 147501 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a gloves from those items.");
            quest::summonitem(67115);		
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
#::Chain Turn-ins
	#:: Chest
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147496 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a chest piece from those items.");
            quest::summonitem(67113);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Helmet
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147495 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make helmet from those items.");
            quest::summonitem(67110);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Legs
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147497 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make leg pieces from those items.");
            quest::summonitem(67112);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Boots
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147498 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a set of sandles from those items.");
            quest::summonitem(67109);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Sleeves
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147499 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make sleeves from those items.");
            quest::summonitem(67111);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Wrists
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147500 => 1)) {
        if ($client->TakeMoneyFromPP(4000, 1)) {
            quest::say("I was able to make a wrist pieces from those items.");
            quest::summonitem(67107);
            quest::summonitem(67107);
            quest::exp(15000);
			$client->Message( 15, "The blacksmith takes 4 platinum from you for his services")
		}
}
	#:: Gloves
    elsif (plugin::check_handin(\%itemcount, 52303 => 1 , 147501 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a gloves from those items.");
            quest::summonitem(67108);		
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
#:: Weapon Turn-Ins
	#:: Club
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147505 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a chest piece from those items.");
            quest::summonitem(67128);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Dagger
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147506 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make helmet from those items.");
            quest::summonitem(67130);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Fists
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147504 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make leg pieces from those items.");
            quest::summonitem(67131);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Greataxe
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147503 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make a set of sandles from those items.");
            quest::summonitem(67132);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
}
	#:: Shortsword
    elsif (plugin::check_handin(\%itemcount, 86012 => 1 , 147502 => 1)) {
        if ($client->TakeMoneyFromPP(2000, 1)) {
            quest::say("I was able to make sleeves from those items.");
            quest::summonitem(67129);
            quest::exp(10000);
			$client->Message( 15, "The blacksmith takes 2 platinum from you for his services")
		}
} else {
		$client->Message( 15, "You don't have enough money to pay the Blacksmith!")
}
    #:: Return unused items
    plugin::return_items(\%itemcount);
}