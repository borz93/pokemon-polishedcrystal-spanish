CianwoodCityPhotoStudio_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_PHOTOGRAPH
	iftrue_jumpopenedtext PhotoStudioAlreadyDoneText
	writetext PhotoStudioGreetingText
	yesorno
	iffalse_jumpopenedtext PhotoStudioRefusedText
	writetext PhotoStudioWhichMonText
	promptbutton
	special Special_CianwoodPhotograph
	ifequalfwd $0, .NoPicture
	ifequalfwd $1, .EggPicture
	setflag ENGINE_DAILY_PHOTOGRAPH
	writetext PhotoStudioHoldStillText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	callasm LoadBlindingFlashPalette
	pause 10
	playsound SFX_DOUBLE_SLAP
	waitsfx
	pause 10
	special FadeInPalettes_EnableDynNoApply
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext PhotoStudioPrestoText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "Vuelve pronto,"
	line "¿vale?"
	done

.NoPicture:
	jumpthisopenedtext

	text "¿Sin foto,"
	line "entonces?"
	cont "Vuelve pronto."
	done

.EggPicture:
	jumpthisopenedtext

	text "¿Un Huevo? Mi"
	line "talento vale más"
	cont "que eso…"
	done

PhotoStudioGreetingText:
	text "Soy Cameron,"
	line "el fotógrafo."

	para "Tienes #mon"
	line "magníficos"
	cont "contigo."

	para "¿Qué tal una foto"
	line "de recuerdo?"
	done

PhotoStudioWhichMonText:
	text "¡Vale! ¡Sonríe!"

	para "¿A qué #mon"
	line "debería"
	cont "fotografiar?"
	done

PhotoStudioHoldStillText:
	text "Muy bien. Quédate"
	line "quieto un rato."
	done

PhotoStudioPrestoText:
	text "¡Listo! Ya está."

	para ""
	text_ram wStringBuffer3
	text " se ve"
	line "más feliz!"
	done

PhotoStudioAlreadyDoneText:
	text "Ya te hice una"
	line "foto hoy."

	para "Vuelve mañana."
	done

PhotoStudioRefusedText:
	text "Vaya, qué pena."
	line "Pensé que sería"

	para "un gran"
	line "recuerdo…"
	done
