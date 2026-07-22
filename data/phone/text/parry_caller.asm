ParryNothingCanMatchText:
	text "Nada puede con"
	line "mi "
	text_ram wStringBuffer4
	text " ahora."
	done

ParryDefeatedMonText:
	text "Sí, dejamos K.O."
	line "a un "
	text_ram wStringBuffer4
	text " salvaje!"

	para "Estuvo bien, pero"
	line "quería"
	cont "atraparlo…"
	done

ParryLostAMonText:
	text "Y ayer, vimos"
	line "un"

	para ""
	text_ram wStringBuffer4
	text "."
	line "Dudábamos"

	para "si atraparlo o"
	line "vencerlo."

	para "Entonces vino"
	line "otro tipo que"

	para "lo atrapó!"
	line "¡Cómo mola!"
	done

ParryBattleRematchText:
	text "Estás pensando"
	line "que quieres"

	para "combatir"
	line "conmigo. ¿Tengo"
	cont "razón o qué?"

	para "¡Sí! Nos vemos"
	line "en:"
	text_ram wStringBuffer5
	text "!"
	done

ParryHangUpText:
	text "¡Vale, llámame"
	line "otra vez!"
	done

ParryBattleWithMeText:
	text "¿Combatirás"
	line "conmigo de nuevo?"
	done

ParryHaventYouGottenToText:
	text "¿Aún no has"
	line "llegado a:"
	text_ram wStringBuffer5
	text "?"

	para "Esperar aquí no"
	line "está mal, pero"
	cont "quiero"
	cont "combatir!"
	done
