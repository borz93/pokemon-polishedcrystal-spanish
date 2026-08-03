BethAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."
	para "Ah, <PLAYER>."
	line "Buenos días."
	para ""
	done

BethAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah. Hola, <PLAYER>."
	done

BethAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAYER>."
	line "Buenas noches."
	done

BethGreetText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

BethGreetDayText:
	text "¡Hola, <PLAYER>!"
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Tienes un"
	line "momento?"
	done

BethGreetNiteText:
	text "Hola, <PLAYER>."
	line "Buenas noches."

	para "Soy "
	text_ram wStringBuffer3
	text "."

	para "Espero que"
	line "estuvieras"
	cont "despierto."
	done

BethGenericText:
	text "¿Eres de los que"
	line "van al Centro"
	cont "#mon a menudo?"

	para "Yo voy cada día."
	line "Cuidar la salud"

	para "de tus #mon es"
	line "parte básica de"

	para "ser entrenador"
	line "#mon."
	done
