LakeOfRageMagikarpHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftruefwd .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftruefwd .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue_jumpopenedtext MagikarpLengthRaterText_MenInBlack
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setmonval MAGIKARP
	special Special_FindThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	iffalse_jumpopenedtext MagikarpLengthRaterText_NotMagikarp
	ifequalfwd $1, .Refused
	ifequalfwd $2, .TooShort
.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXIR
	iffalsefwd .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	jumpthisopenedtext

	text "¡Vaya! ¡Este es"
	line "excepcional!"

	para "…Ojalá pudiera"
	line "decir eso, pero ya"

	para "he visto uno más"
	line "grande antes."
	done

.Refused:
	jumpthisopenedtext

	text "Vaya… ¿No"
	line "conseguiste uno"

	para "lo bastante bueno"
	line "para enseñarme?"
	cont "Quizá la próxima."
	done

MagikarpLengthRaterText_LakeOfRageHistory:
	text "El Lago de la"
	line "Furia es en"
	cont "realidad un"
	cont "cráter"

	para "hecho por"
	line "Gyarados"
	cont "enfurecidos."

	para "El cráter se llenó"
	line "de agua de lluvia"

	para "y así se formó el"
	line "lago."

	para "Esa es la historia"
	line "que me contó el"

	para "bisabuelo de mi"
	line "abuelo."

	para "Antes se podían"
	line "pescar Magikarp"

	para "llenos de vida"
	line "ahí, pero…"

	para "No entiendo qué"
	line "está pasando."
	done

MagikarpLengthRaterText_MenInBlack:
	text "El lago no ha sido"
	line "normal desde que"

	para "llegaron esos"
	line "hombres de negro."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "El Lago de la"
	line "Furia volvió a"
	cont "la normalidad."

	para "Los Magikarp han"
	line "regresado."

	para "Quizá aún pueda"
	line "cumplir mi sueño"
	cont "de ver el Magikarp"
	cont "más grande del"
	cont "mundo."

	para "¿Tienes una Caña?"
	line "Por favor, ayúdame"
	cont "si es así."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, ¡tienes un"
	line "Magikarp! Veamos"

	para "qué tan grande es"
	line "esa cosita."
	done

MagikarpLengthRaterText_Memento:
	text "¡Vaya! ¡Este es"
	line "excepcional!"

	para "¡Me quito el"
	line "sombrero ante ti!"

	para "¡Toma esto como"
	line "recuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "Lo importante es"
	line "el récord."

	para "¡Piensa en eso"
	line "como un extra!"
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un Magikarp!"
	done
