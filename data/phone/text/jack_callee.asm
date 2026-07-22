JackAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Buenos días,"
	line "<PLAYER>!"
	done

JackAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¿Qué tal,"
	line "<PLAYER>?"
	done

JackAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Buenas noches,"
	line "<PLAYER>!"
	done

JackGreetText:
	text "<PLAYER>, ¡buenos"
	line "días!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

JackGreetDayText:
	text "<PLAYER>, ¡hola!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿A que hace"
	cont "buen día?"
	done

JackGreetNiteText:
	text "<PLAYER>, ¡buenas"
	line "noches!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Tienes un"
	cont "minuto?"
	done

JackGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "tan curioso que"
	cont "es un problema."

	para "Quizá sea"
	line "como yo…"
	done
