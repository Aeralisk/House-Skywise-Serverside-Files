sub EVENT_SAY {
	 #:: Match test for hail, case insensitive
	 if ($text=~/hail/i)  {
		  $client->Message( 18, "The elf says to you, 'Greetings stranger. If you need a copy of the server's maps, I suggest you navigate to " . quest::saylink("Brewall's Maps") . " and download a copy.'")
	 }
	 elsif ($text=~/brewall's maps/i) {
		  $client->Message( 18, "The elf says to you, 'To install these maps, just google Brewall's Maps and head to his website. There are guides there to assist you. If you are having trouble, just contact a staff member either in game or on " . quest::saylink("discord") . ".'")
	 }
	 elsif ($text=~/discord/i) {
		  $client->Message( 18, "The elf says to you, 'To connect to discord, just type this link into any browser!' https://discord.gg/3BvPZZA ")
	 }
}