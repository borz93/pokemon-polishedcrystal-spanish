ChadAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAYER>!"
	line "¡Buenos días!"
	done

ChadAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAYER>,"
	line "buen día!"
	done

ChadAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAYER>,"
	line "buenas noches!"
	done

ChadGreetText:
	text "¡Hola, <PLAYER>,"
	line "buenos días!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal?"
	done

ChadGreetDayText:
	text "¡Hola, <PLAYER>,"
	line "buen día!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal?"
	done

ChadGreetNiteText:
	text "¡Hola, <PLAYER>,"
	line "buenas noches!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal?"
	done

ChadGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Conoces al Prof."
	line "Oak, así que tus"
	cont "#mon están"
	cont "bien, claro!"

	para "Los míos también"
	line "están bien."

	para "Pero claro, yo"
	line "intento ser"

	para "profesor #mon,"
	line "así que no"
	cont "debería"
	cont "sorprender."
	done
