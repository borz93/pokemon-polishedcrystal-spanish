PokemonFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, VERMILION_CITY, 3
	warp_event  5,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, PokemonFanClubListenSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, PokemonFanClubBraggingSignText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalGreenScript

	def_object_events
	object_event  2,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, ClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  4,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubReceptionistText, -1
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubTeacherText, -1
	pokemon_event  7,  3, ODDISH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GREEN, FanClubOddishText, -1

	object_const_def
	const POKEMONFANCLUB_CLEFAIRY_DOLL

PokemonFanClubChairmanScript:
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue_jumptextfaceplayer PokemonFanClubChairmanMoreTalesToTellText
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftruefwd .HeardSpeech
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse_jumpopenedtext PokemonFanClubChairmanHowDisappointingText
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeech:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	jumpthisopenedtext

	text "Es un"
	line "Carameloraro que"
	cont "fortalece a los"
	cont "#mon."

	para "Prefiero"
	line "fortalecer a los"
	cont "míos combatiendo,"
	cont "así que puedes"
	cont "quedártelo."
	done

PokemonFanClubClefairyGuyScript:
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue_jumptextfaceplayer PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	faceplayer
	opentext
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftruefwd .FoundClefairyDoll
	waitendtext
.FoundClefairyDoll:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	disappear POKEMONFANCLUB_CLEFAIRY_DOLL
	verbosegivekeyitem LOST_ITEM
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	endtext

PokemonJournalGreenScript:
	setflag ENGINE_READ_GREEN_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡La"
	cont "Entrenadora <PK>"
	cont "<MN> Leaf!"

	para "Además de ser una"
	line "entrenadora"
	cont "poderosa, dicen"

	para "que a Leaf le"
	line "fascinan los"
	cont "#mon"
	cont "legendarios."
	done

ClefairyDollScript:
	jumpthistext

	text "¡Es un Clefairy!"
	line "¿Eh?"

	para "Ah, cierto. Es un"
	line "Muñeco # de"
	cont "Clefairy."
	done

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Soy el Presidente"
	line "del Club de Fans"
	cont "#mon."

	para "He criado más de"
	line "150 #mon."

	para "Soy muy exigente"
	line "en cuanto a"
	cont "#mon."

	para "¿Viniste solo"
	line "para oír hablar de"
	cont "mi #mon?"
	done

PokemonFanClubChairmanRapidashText:
	text "¡Bien!"
	line "¡Entonces escucha!"

	para "Así que… mi"
	line "Rapidash"
	cont "favorito…"

	para "Es… mono…"
	line "encantador…"
	cont "listo…"
	cont "insoportablemente…"
	cont "y además…"
	cont "increíble… oh…"
	cont "¿Verdad que sí?…"
	cont "Demasiado…"
	cont "salvaje…"
	cont "precioso… tierno…"
	cont "¡me encanta!"

	para "Abrazarlo…"
	line "cuando duerme…"
	cont "cálido y"
	cont "achuchable… Ah,"
	cont "y… espectacular…"
	cont "arrebatador…"
	cont "sencillamente"
	cont "divino…"
	cont "¡Uy! ¡Mira la"
	cont "hora! ¡Te he"
	cont "entretenido"
	cont "demasiado!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Gracias por"
	line "escucharme."
	cont "¡Quiero que tengas"
	cont "esto!"
	done


PokemonFanClubChairmanMoreTalesToTellText:
	text "¡Hola, <PLAYER>!"

	para "¿Viniste a verme"
	line "otra vez para"
	cont "hablar de mi"
	cont "#mon?"

	para "¿No? Oh… Tenía más"
	line "historias que"
	cont "contar…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Qué decepción…"

	para "Vuelve si quieres"
	line "escuchar."
	done

PokemonFanClubReceptionistText:
	text "Nuestro Presidente"
	line "es muy hablador"
	cont "con lo de los"
	cont "#mon…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Me encanta cómo"
	line "Clefairy mueve el"

	para "dedo cuando"
	line "intenta usar"

	para "Metrónomo."
	line "¡Es tan adorable!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Me encanta"
	line "Clefairy, pero"

	para "nunca pude atrapar"
	line "uno. Así que me"

	para "conformo con un"
	line "#Muñeco que"
	cont "encontré."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Oh, ya veo. La"
	line "chica que perdió"

	para "este Muñeco #"
	line "está triste…"

	para "Vale. ¿Podrías"
	line "llevarle este"
	cont "#Muñeco "

	para "de vuelta a esa"
	line "pobre chica?"

	para "Algún día haré"
	line "amistad con un"
	cont "Clefairy de"
	cont "verdad."

	para "¡No te preocupes!"
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Ya verás. Voy a"
	line "conseguir un"

	para "Clefairy de verdad"
	line "como amigo."
	done

PokemonFanClubTeacherText:
	text "¡Mira a mi"
	line "adorado Oddish!"

	para "¡Las hojas de su"
	line "cabeza son tan"
	cont "monas!"
	done

FanClubOddishText:
	text "Oddish: ¡Diish!"
	done

PokemonFanClubListenSignText:
	text "Escuchemos todos"
	line "con respeto a los"
	cont "demás"
	cont "entrenadores."
	done

PokemonFanClubBraggingSignText:
	text "Si alguien"
	line "presume, ¡devuelve"
	cont "el golpe!"
	done
