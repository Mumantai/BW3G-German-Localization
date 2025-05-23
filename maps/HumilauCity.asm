	const_def 2 ; object constants
	const HUMILAUCITY_COOLTRAINERF
	const HUMILAUCITY_COOLTRAINERM
	const HUMILAUCITY_FISHER
	const HUMILAUCITY_LASS
	const HUMILAUCITY_YOUNGSTER
	const HUMILAUCITY_TEACHER
	const HUMILAUCITY_NEIGHBOR
	const HUMILAUCITY_MARINETUBE_BLOCKER
	const HUMILAUCITY_BLOCKER_ROAMING
	const HUMILAUCITY_GYM_BLOCKER
	const HUMILAUCITY_PC_BLOCKER
	const HUMILAUCITY_SHELL_BELL

HumilauCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .MoveBlockers

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_HUMILAU
	checkevent EVENT_TALKED_TO_MOM_AFTER_POKEMON
	iftrue .done
	checkflag ENGINE_WAVEBADGE
	iffalse .done
	specialphonecall SPECIALCALL_MOM_LECTURE
.done
	return

.MoveBlockers:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .End
	disappear HUMILAUCITY_PC_BLOCKER
	checkevent EVENT_MET_MARLON_IN_UNDELLA
	iffalse .End
	disappear HUMILAUCITY_MARINETUBE_BLOCKER
	disappear HUMILAUCITY_GYM_BLOCKER
	appear HUMILAUCITY_BLOCKER_ROAMING
.End
	return
	
HumilauCity_NeighborStopsYouScene:
	turnobject HUMILAUCITY_NEIGHBOR, DOWN
	showemote EMOTE_SHOCK, HUMILAUCITY_NEIGHBOR, 15
	turnobject PLAYER, UP
	opentext
	writetext NeighborText_DontLeave
	waitbutton
	closetext
	applymovement PLAYER, HumilauCity_DontLeaveMovement
	end
	
NeighborTextScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue NeighborText_PokemonScript
	writetext NeighborText_Dangerous
	waitbutton
	closetext
	end
	
NeighborText_PokemonScript:
	writetext NeighborText_Pokemon
	waitbutton
	closetext
	end
	
HumilauCityTubeBlockerTextScript:
	jumptextfaceplayer HumilauCityTubeBlockerText
	
HumilauCityRoamingBlockerTextScript:
	jumptextfaceplayer HumilauCityRoamingBlockerText
	
HumilauCityGymBlockerTextScript:
	jumptextfaceplayer HumilauCityGymBlockerText
	
HumilauCityPCBlockerTextScript:
	jumptext HumilauCityPCBlockerText
	
HumilauCityFisherTextScript:
	jumptextfaceplayer HumilauCityFisherText
	
HumilauCityLassTextScript:
	jumptextfaceplayer HumilauCityLassText
	
HumilauCityCooltrainerFTextScript:
	jumptextfaceplayer HumilauCityCooltrainerFText
	
HumilauCityCooltrainerMTextScript:
	jumptextfaceplayer HumilauCityCooltrainerMText
	
HumilauCityYoungsterTextScript:
	jumptextfaceplayer HumilauCityYoungsterText
	
HumilauCityTeacherTextScript:
	jumptextfaceplayer HumilauCityTeacherText
	
HumilauCitySign:
	jumptext HumilauCitySignText
	
HumilauMarlonSign:
	jumptext HumilauMarlonSignText
	
HumilauMarineTubeSign:
	jumptext HumilauMarineTubeSignText
	
HumilauCityShellBell:
	itemball SHELL_BELL

HumilauCity_DontLeaveMovement:
	step RIGHT
	step_end
	
NeighborText_DontLeave:
	text "Warte, <PLAY_G>!"

	para "Außerhalb der"
	line "Stadt ist es"
	para "gefährlich!"

	para "Wilde #MON"
	line "könnten dich"
	cont "angreifen!"
	done

NeighborText_Pokemon:
	text "Oh wow! So ein"
	line "süßes #MON!"
	done

NeighborText_Dangerous:
	text "Oh, hi, <PLAY_G>."

	para "Hier geht es zur"
	line "ROUTE 22."

	para "Geh lieber nicht"
	line "weiter."

	para "Da draußen ist es"
	line "nicht sicher."

	para "Wilde #MON"
	line "könnten dich"
	cont "angreifen!"
	done

HumilauCityTubeBlockerText:
	text "Ich wollte in den"
	line "UNTERSEETUNNEL, um"

	para "nach ONDULA zu"
	line "kommen…"

	para "Aber er ist voll"
	line "von Touristen!"
	done

HumilauCityRoamingBlockerText:
	text "Puh! Die Touristen"
	line "sind endlich"
	cont "verschwunden…"
	done

HumilauCityGymBlockerText:
	text "Der ARENALEITER"
	line "ist wohl gerade"
	cont "nicht da…"

	para "Ich wollte doch"
	line "gegen ihn kämpfen!"
	done

HumilauCityPCBlockerText:
	text "Hmm…"

	para "Welches #MON"
	line "nehm ich heute"
	cont "wohl mit…?"
	done

HumilauCityFisherText:
	text "Die Technik ist"
	line "unglaublich!"

	para "Man kann jetzt"
	line "Spiele verändern"

	para "und im Internet"
	line "mit teilen!"
	done

HumilauCityLassText:
	text "Ist es nicht toll,"
	line "so nah am Meer"
	cont "zu leben?"
	done

HumilauCityCooltrainerFText:
	text "Wow, der Blick"
	line "aufs Meer ist so"
	cont "umwerfend!"
	done

HumilauCityCooltrainerMText:
	text "Ich bin mit meiner"
	line "Freundin hier zum"
	cont "Urlaub."

	para "Hier zu leben,"
	line "muss wirklich"
	cont "schön sein!"
	done

HumilauCityYoungsterText:
	text "Ich will im hohen"
	line "Gras spielen, aber"

	para "meine Mama sagt,"
	line "das ist viel zu"

	para "gefährlich."
	line "Hätte ich doch"
	cont "nur ein #MON!"
	done

HumilauCityTeacherText:
	text "Hallo, <PLAY_G>."

	para "Warst du schon im"
	line "#-SUPERMARKT?"

	para "Dort findest du"
	line "nützliche Items,"
	cont "für deine Reise."

	para "Schau auf jeden"
	line "Fall vorbei, bevor"

	para "du dich auf den"
	line "Weg machst!"
	done

HumilauCitySignText:
	text "ABIDAYA CITY"

	para "Die Stadt des"
	line "ruhigen Seegangs."
	done

HumilauMarlonSignText:
	text "BENSONs Haus."
	done

HumilauMarineTubeSignText:
	text "UNTERSEETUNNEL"

	para "Unterwasserweg"
	line "nach ONDULA."
	done
	
HumilauCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  9,  7, PLAYERS_HOUSE_1F, 1
	warp_event 23,  3, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event  3, 27, HUMILAU_POKECENTER_1F, 1
	warp_event  9, 15, MARLONS_HOUSE, 1
	warp_event 17, 29, MARINE_TUBE_ENTRANCE, 5
	warp_event  8, 23, HUMILAU_GYM, 1
	warp_event  3, 13, HUMILAU_TRADE_HOUSE, 1

	db 1 ; coord events
	coord_event  1,  9, SCENE_DEFAULT, HumilauCity_NeighborStopsYouScene

	db 3 ; bg events
	bg_event 11, 27, BGEVENT_READ, HumilauCitySign
	bg_event 11, 16, BGEVENT_READ, HumilauMarlonSign
	bg_event 15, 29, BGEVENT_READ, HumilauMarineTubeSign

	db 12 ; object events
	object_event  8, 34, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HumilauCityCooltrainerFTextScript, -1
	object_event 10, 33, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 3, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HumilauCityCooltrainerMTextScript, -1
	object_event 17, 16, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE_D, OBJECTTYPE_SCRIPT, 0, HumilauCityFisherTextScript, -1
	object_event 17,  9, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HumilauCityLassTextScript, -1
	object_event 11,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 4, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HumilauCityYoungsterTextScript, -1
	object_event 24,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 3, -1, -1, PAL_NPC_BLUE_D, OBJECTTYPE_SCRIPT, 0, HumilauCityTeacherTextScript, -1
	object_event  1,  8, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NeighborTextScript, -1
	object_event 17, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HumilauCityTubeBlockerTextScript, EVENT_HUMILAU_CITY_TUBE_BLOCKER
	object_event 13, 27, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HumilauCityRoamingBlockerTextScript, EVENT_HUMILAU_CITY_ROAMING_BLOCKER
	object_event  8, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HumilauCityGymBlockerTextScript, EVENT_HUMILAU_CITY_GYM_BLOCKER
	object_event  3, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_SCRIPT, 0, HumilauCityPCBlockerTextScript, EVENT_HUMILAU_CITY_PC_BLOCKER
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HumilauCityShellBell, EVENT_HUMILAU_CITY_SHELL_BELL
	