BeverlyAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ah! Buenos"
	line "días, <PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ah! Buen"
	line "día, <PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ah! Buenas"
	line "noches, <PLAYER>."
	done

BeverlyGreetText:
	text "Hola, <PLAYER>."
	line "Buenos días."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

BeverlyGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Qué tal estás?"
	done

BeverlyGreetNiteText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Estabas"
	line "despierto?"
	done

BeverlyGenericText:
	text "¿Tienes felices"
	line "a tus #mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " está"
	line "sana. Come"
	cont "mucho cada día."
	done
