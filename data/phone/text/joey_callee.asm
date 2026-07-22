JoeyAnswerPhoneText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Ah, <PLAYER>?"
	line "¿Todo bien?"
	done

JoeyAnswerPhoneDayText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Ah, <PLAYER>?"
	line "¿Todo bien?"
	done

JoeyAnswerPhoneNiteText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Ah, <PLAYER>?"
	line "¿Todo bien?"
	done

JoeyGreetText:
	text "¡Eh, <PLAYER>!"
	line "¿Qué tal?"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿tienes un"
	cont "minuto?"
	done

JoeyGreetDayText:
	text "¡Eh, <PLAYER>!"
	line "¿Cómo va todo?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Tienes un"
	cont "minuto?"
	done

JoeyGreetNiteText:
	text "¡Eh, <PLAYER>!"
	line "¿Qué tal?"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿tienes un"
	cont "minuto?"
	done

JoeyGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " está"
	line "lista para todo,"
	cont "como siempre."

	para "Es la única que"
	line "tengo. Voy a"

	para "ser una gran"
	line "entrenadora con"
	cont "ella!"
	done
