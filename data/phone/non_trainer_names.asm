NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2
	dw EmptyString
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .lyra
	dw .buena
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.mom:
	text  "Mamá:"
	done
.bill:
	text  "Bill:"
	next1 "   #maniac"
	done
.elm:
	text  "Prof.Elm:"
	next1 "   Prof. #mon"
	done
.bikeshop:
	text  "Bici Milagro:"
	done
.lyra:
	text  "Lyra:"
	next1 "   Entre. <PK><MN>"
	done
.buena:
	text  "Buena:"
	next1 "   DJ"
	done
