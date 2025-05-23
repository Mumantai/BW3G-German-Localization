	const_def 2 ; object constants
	const HUMILAUTRADEHOUSE_YOUNGSTER

HumilauTradeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HumilauTradeHouseScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .nopoke
	trade NPC_TRADE_HUMILAU
	waitbutton
	closetext
	end
	
.nopoke
	writetext HumilauTradeHouseNoPokeText
	waitbutton
	closetext
	end

HumilauTradeHouseBookshelfScript:
	jumpstd magazinebookshelf

HumilauTradeHouseNoPokeText:
	text "Hey, wilst du"
	line "#MON tauschen?"

	para "Oh, du hast gar"
	line "keine #MON?"
	cont "Zu schade."
	done

HumilauTradeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, HUMILAU_CITY, 7
	warp_event  3,  7, HUMILAU_CITY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HumilauTradeHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, HumilauTradeHouseBookshelfScript
	
	db 1 ; object events
	object_event  2,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED_D, OBJECTTYPE_SCRIPT, 0, HumilauTradeHouseScript, -1
	