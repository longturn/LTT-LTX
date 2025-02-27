
[spec]

; Format and options of this spec file:
options = "+Freeciv-spec-Devel-2019-Jul-03"

[info]

artists = "
    Tatu Rissanen <tatu.rissanen@hut.fi>
    The Square Cow (u.migrants)
    GriffonSpade
    Sketlux (XYZ)
    VladimirSlavik
    Eleazar
    FiftyNine
    Ngunjaca
    HF & louis94
"

[file]
gfx = "trident-SG4/units"

[grid_main]

x_top_left = 0
y_top_left = 0
dx = 30
dy = 30
pixel_border = 1

tiles = { "row", "column", "tag"
				; 
  0,  0, "u.armor"		; 
  0,  1, "u.howitzer"		; 
  0,  2, "u.battleship"		; 
  0,  3, "u.bomber"		; 
  0,  4, "u.cannon"		; 
  0,  5, "u.caravan"		; 
  0,  6, "u.carrier"		; 
  0,  7, "u.catapult"		; 
  0,  8, "u.horsemen"		; 
  0,  9, "u.chariot"		; 
  0, 10, "u.cruiser"		; 
  0, 11, "u.diplomat"		; 
  0, 12, "u.fighter"		; 
  0, 13, "u.frigate"		; 
  0, 14, "u.ironclad"		; 
  0, 15, "u.knights"		; 
  0, 16, "u.legion"		; 
  0, 17, "u.mech_inf"		; 
  0, 18, "u.warriors"		; 
  0, 19, "u.musketeers"		; 
  1,  0, "u.nuclear"		; 
  1,  1, "u.phalanx"		; 
  1,  2, "u.riflemen"		; 
  1,  3, "u.caravel"		; 
  1,  4, "u.settlers"		; 
  1,  5, "u.submarine"		; 
  1,  6, "u.transport"		; 
  1,  7, "u.trireme"		; 
  1,  8, "u.archers"		; 
  1,  9, "u.cavalry"		; 
  1, 10, "u.cruise_missile"	; 
  1, 11, "u.destroyer"		; 
  1, 12, "u.dragoons"		; 
  1, 13, "u.explorer"		; 
  1, 14, "u.freight"		; 
  1, 15, "u.galleon"		; 
  1, 16, "u.partisan"		; 
  1, 17, "u.pikemen"		; 
  1, 18, "u.raider"		; 
  1, 19, "u.navytroops"		; 
  2,  0, "u.marines"		; 
  2,  1, "u.spy"		; 
  2,  2, "u.engineers"		; 
  2,  3, "u.artillery"		; 
  2,  4, "u.helicopter"		; 
  2,  5, "u.alpine_troops"	; 
  2,  6, "u.stealth_bomber"	; 
  2,  7, "u.stealth_fighter"	; 
  2,  8, "u.aegis_cruiser"	; 
  2,  9, "u.paratroopers"	; 
  2, 10, "u.elephants"		; 
  2, 11, "u.crusaders"		; 
  2, 12, "u.fanatics"		; 
  2, 13, "u.awacs"		; 
  2, 14, "u.worker"		; 
  2, 15, "u.leader"		; 
  2, 16, "u.barbarian_leader"	; 
  2, 17, "u.migrants"		; 
  2, 18, "u.knarr"		; 
  2, 19, "u.scholar"		; 
  3,  0, "u.barge"    		; 
  3,  1, "u.tribal_worker"   	; 
  3,  2, "u.immigrant"  	; 
  3,  3, "u.scribe"     	; 
  3,  4, "u.inventor"    	; 
  3,  5, "u.canoe"   		; 
  3,  6, "u.scientist"  	; 
  3,  7, "u.infantry"   	; 
  3,  8, "u.operative"  	; 
  3,  9, "u.nsubmarine" 	; 
  3, 10, "u.fusion_bomber" 	; 
  3, 11, "u.longboat"  		; 
  3, 12, "u.srcaravel" 		; 
  3, 13, "u.missile" 		; 
  3, 14, "u.cruise_missile" 	; 
  3, 15, "u.fusion_missile" 	; 
  3, 16, "u.trebuchet" 		; 
  3, 17, "u.pirogue"		; 
  3, 18, "u.cog"		; 
  3, 19, "u.pcutter"		; 
  4,  0, "u.militia"		; 
  4,  1, "u.mounted_militia"	; 
  4,  2, "u.transport_aircraft"	; 
  4,  3, "u.jet_fighter"	; 
  4,  4, "u.tribal_knarr"	; 
  4,  5, "u.mobile_howitzer"	; 
  4,  6, "u.dromedarii"		; 
  4,  7, "u.sam"		;   
  4,  8, "u.arbalest"		; 
  4,  9, "u.advanced_warrior"   ; 
  4, 10, "u.scout"		; 
  4, 11, "u.mounted_archer"	; 
  4, 12, "u.quinquireme"	; 
;  4, 12, ""		;
  4, 13, "u.nuclearbomb"	;
  4, 14, "u.cargoair"		; 
  4, 15, "u.fusion_fighter"	; 
  4, 16, "u.flagship_frigate"	; 
  4, 17, "u.fusion_armor"	; 
  4, 18, "u.brig"		; 
  4, 19, "u.fusion_battleship"	;
  5,  0, "u.early_fighter"	; 
  5,  1, "u.early_bomber"	; 
  5,  2, "u.early_jet_fighter"	; 
  5,  3, "u.advanced_bomber"	; 
  5,  4, "u.attack_aircraft"	; 
  5,  5, "u.advanced_attack_aircraft"	; 
  5,  6, "u.early_armor"	; 
  5,  7, "u.advanced_armor"	; 
  5,  8, "u.tank_hunter"	; 
  5,  9, "u.technical"		; 
  5,  10, "u.transport_helicopter" 	; 
  5,  11, "u.gunship_helicopter"; 	
  5,  12, "u.motorized_infantry" 	; 
  5,  13, "u.samurai"		; 
  5,  14, "u.halberdier" 	; 
  5,  15, "u.grenadier" 	; 
  5,  16, "u.stormtrooper" 	; 
  5,  17, "u.mounted_infantry" 	; 
  5,  18, "u.early_submarine" 	; 
  5,  19, "u.zeppelin"	 	; 
  6,   0, "u.dredger"		;
  6,   1, "u.monitor"		;
  6,   2, "u.tachanka"		;
  6,   3, "u.armored_car"	; 
  6,   4, "u.armored_train"	; 
  6,   5, "u.corsair"		; 
  6,   6, "u.siege_tower"	;
}
