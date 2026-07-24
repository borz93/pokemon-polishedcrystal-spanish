LizAnswerPhoneText:
	text "Hola, soy "
	text_ram wStringBuffer3
	line "al habla."

	para "Ah, <PLAYER>."
	line "Buenos días."
	done

LizAnswerPhoneDayText:
	text "Hola, soy "
	text_ram wStringBuffer3
	line "al habla."

	para "Ah, <PLAYER>."
	line "¿Qué tal?"
	done

LizAnswerPhoneNiteText:
	text "Hola, soy "
	text_ram wStringBuffer3
	line "al habla."

	para "Ah, <PLAYER>."
	line "Buenas noches."
	done

LizGreetText:
	text "Buenos días,"
	line "<PLAYER>."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

LizGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Cómo te van"
	line "las cosas?"
	done

LizGreetNiteText:
	text "Buenas noches,"
	line "<PLAYER>."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Despierto?"
	done

LizGenericText:
	text "Tenía tiempo,"
	line "así que te"
	cont "llamé."

	para "Bueno, Cómo"
	line "están tus #mon?"

	para "Yo llevo a mi"
    line ""
	text_ram wStringBuffer4
	line "al"
	cont "Centro #mon"
	cont "de Malva cada"
	cont "día,"

	para "así que está"
	line "genial!"

	para "Soy amiga de la"
	line "recepcionista!"
	done
