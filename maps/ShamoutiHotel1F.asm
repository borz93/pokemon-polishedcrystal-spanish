ShamoutiHotel1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ShamoutiHotel1FRestaurantTrigger

	def_warp_events
	warp_event  8,  7, SHAMOUTI_ISLAND, 2
	warp_event  9,  7, SHAMOUTI_ISLAND, 2
	warp_event  2,  0, SHAMOUTI_HOTEL_2F, 1
	warp_event 14,  0, SHAMOUTI_HOTEL_RESTAURANT, 1

	def_coord_events

	def_bg_events
	bg_event 15,  0, BGEVENT_JUMPTEXT, ShamoutiHotelRestaurantSignText

	def_object_events
	object_event  8,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FReceptionistText, -1
	object_event  2,  4, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiHotel1FArtistScript, -1
	object_event  5,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FCooltrainermText, -1
	object_event 12,  5, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FLadyText, -1
	object_event 14,  7, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FYoungsterText, -1

ShamoutiHotel1FRestaurantTrigger:
	setmapscene SHAMOUTI_HOTEL_RESTAURANT, SCENE_SHAMOUTIHOTELRESTAURANT_MEET
	endcallback

ShamoutiHotel1FReceptionistText:
	text "Bienvenido al"
	line "Hotel Shamouti."

	para "Me temo que todas"
	line "las habitaciones"
	cont "están reservadas,"

	para "pero visita"
	line "nuestro"
	cont "Restaurante Oasis"
	cont "de lujo."
	done

ShamoutiHotel1FArtistScript:
	faceplayer
	opentext
	checkflag ENGINE_CHANGED_TRENDY_PHRASE
	iftruefwd .SetTrendyPhraseToday
	writetext .Text1
	yesorno
	iftruefwd .Yes
	writetext .Text2
	promptbutton
	special SpecialTrendyPhrase
	setflag ENGINE_CHANGED_TRENDY_PHRASE
	jumpopenedtext .Text3

.SetTrendyPhraseToday
	jumpopenedtext .Text4

.Yes
	jumpopenedtext .Text5

.Text1:
	text "Vayas donde"
	line "vayas, <TRENDY>"

	para "¡es lo más guay"
	line "que hay!"
	cont "¿A que sí?"
	done

.Text2:
	text "¡¿Qué?! ¿<TRENDY>"
	line "no es lo más"
	cont "guay que hay?"

	para "Bueno, ¿Qué es lo"
	line "más guay ahora?"
	done

.Text3:
	text "¡Ah, sí! ¡Ya lo"
	line "tengo!"

	para "¡<TRENDY> es lo"
	line "mejor que hay!"
	done

.Text4:
	text "¡<TRENDY> es lo"
	line "más in del"
	cont "momento!"
	done

.Text5:
	text "¡Y que lo digas!"
	line "No me canso de"
	cont "<TRENDY>!"
	done

ShamoutiHotel1FCooltrainermText:
	text "¿Así que <TRENDY>"
	line "es lo nuevo?"

	cont "¡Qué guay!"
	done

ShamoutiHotel1FLadyText:
	text "¿Alguna vez"
	line "encontraste una"
	cont "Chapa pescando?"

	para "En Alola, de donde"
	line "soy, hay un"
	cont "hombre que"

	para "“Entrena al"
	line "Máximo” a tu"
	cont "#mon,"

	para "sacando todo su"
	line "potencial, solo"
	cont "por una Chapa."
	done

ShamoutiHotel1FYoungsterText:
	text "¡Oí que <TRENDY>"
	line "está de moda"
	cont "ahora!"
	done

ShamoutiHotelRestaurantSignText:
	text "Restaurante Oasis"
	done
