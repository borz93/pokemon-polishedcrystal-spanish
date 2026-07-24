DerekAnswerPhoneText:
	text "¿Hola, <PLAYER>?"

	para "Buen pika día."
	line "¿Qué pika tal?"
	done

DerekAnswerPhoneDayText:
	text "¿Hola, <PLAYER>?"

	para "Buen pika día,"
	line "¿Qué pika tal?"
	done

DerekAnswerPhoneNiteText:
	text "¿Hola, <PLAYER>?"

	para "Buenas noches"
	line "pika, ¿Qué tal?"
	done

DerekGreetText:
	text "<PLAYER> pika,"
	line "¡buenos días!"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿Pika qué tal?"
	done

DerekGreetDayText:
	text "<PLAYER> pika,"
	line "¡buen pika día!"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿Pika qué tal?"
	done

DerekGreetNiteText:
	text "<PLAYER> pika,"
	line "¡buenas noches!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Pika, despierto?"
	done

DerekGenericText:
	text "¡Tienes que oír"
	line "esto! Mi"
	cont "adorable"

	para ""
	text_ram wStringBuffer4
	text " me miró"
	line "y sonrió!"

	para "Debe ser porque"
	line "nuestros"
	cont "corazones laten"
	cont "como uno!"
	done
