DEF FIGHTINGDOJO_REMATCH_VARSPRITE_1 EQU SPRITE_BIG_DOLL
DEF FIGHTINGDOJO_REMATCH_VARSPRITE_2 EQU SPRITE_COPYCAT
DEF FIGHTINGDOJO_REMATCH_VARSPRITE_3 EQU SPRITE_CONSOLE

FightingDojo_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FightingDojoSetupRematchesCallback

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, FightingDojoSign1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, FightingDojoSign2Text
	bg_event  9,  0, BGEVENT_READ, MapFightingDojoSignpost2Script

	def_object_events
	object_event  0,  1, FIGHTINGDOJO_REMATCH_VARSPRITE_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch1Script, EVENT_REMATCH_GYM_LEADER_1
	object_event  0,  2, FIGHTINGDOJO_REMATCH_VARSPRITE_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch2Script, EVENT_REMATCH_GYM_LEADER_2
	object_event  0,  3, FIGHTINGDOJO_REMATCH_VARSPRITE_3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch3Script, EVENT_REMATCH_GYM_LEADER_3
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1

	object_const_def
	const FIGHTINGDOJO_REMATCH_1
	const FIGHTINGDOJO_REMATCH_2
	const FIGHTINGDOJO_REMATCH_3

FightingDojoSetupRematchesCallback:
	disappear FIGHTINGDOJO_REMATCH_1
	disappear FIGHTINGDOJO_REMATCH_2
	disappear FIGHTINGDOJO_REMATCH_3
	checkevent EVENT_BEAT_BLUE
	iftruefwd .SetupDailyRematches
	endcallback

MACRO rematch ; person, sprite, x, y, face, palette
	moveobject FIGHTINGDOJO_REMATCH_\1, \3, \4
	turnobject FIGHTINGDOJO_REMATCH_\1, \5
	setmapobjectpal FIGHTINGDOJO_REMATCH_\1, PAL_NPC_\6
	appear FIGHTINGDOJO_REMATCH_\1
	variablesprite FIGHTINGDOJO_REMATCH_VARSPRITE_\1, SPRITE_\2
ENDM

.SetupDailyRematches:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SundayNight
.SundayMorningAndDay
	rematch 1, JASMINE, 3, 6, RIGHT, RED
	rematch 2, ERIKA, 6, 6, LEFT, GREEN
	endcallback
.SundayNight
	rematch 3, SABRINA, 6, 4, DOWN, RED
	endcallback

.Monday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .MondayNight
.MondayMorningAndDay
	rematch 1, FALKNER, 3, 5, RIGHT, BLUE
	rematch 2, JANINE, 6, 5, LEFT, PURPLE
	endcallback
.MondayNight
	checkevent EVENT_BEAT_WALKER
	iffalsefwd .NoWalker
	rematch 3, WALKER, 8, 4, DOWN, BLUE
.NoWalker
	endcallback

.Tuesday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .TuesdayNight
.TuesdayMorningAndDay
	rematch 1, PRYCE, 3, 6, RIGHT, BROWN
	rematch 2, BLAINE, 6, 6, LEFT, BROWN
	endcallback
.TuesdayNight
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iffalsefwd .NoLorelei
	rematch 3, LORELEI, 6, 4, DOWN, RED
.NoLorelei
	endcallback

.Wednesday
	checktime 1 << MORN
	iftruefwd .WednesdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .WednesdayNight
.WednesdayDay
	rematch 1, BROCK, 3, 7, RIGHT, BROWN
	rematch 2, MISTY, 3, 5, RIGHT, ORANGE
	rematch 3, BLUE, 6, 6, LEFT, BLUE
	endcallback
.WednesdayMorning
	rematch 1, BROCK, 3, 5, RIGHT, BROWN
	rematch 2, MISTY, 6, 5, LEFT, ORANGE
	endcallback
.WednesdayNight
	rematch 3, BLUE, 8, 4, DOWN, BLUE
	endcallback

.Thursday
	checktime 1 << MORN
	iftruefwd .ThursdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .ThursdayNight
.ThursdayDay
	checkevent EVENT_BEAT_PALMER
	iffalsefwd .NoPalmer
	rematch 3, PALMER, 3, 6, DOWN, GREEN
.NoPalmer
	endcallback
.ThursdayMorning
	rematch 1, BUGSY, 1, 6, DOWN, GREEN
	endcallback
.ThursdayNight
	rematch 2, MORTY, 2, 4, DOWN, BROWN
	endcallback

.Friday
	checktime 1 << MORN
	iftruefwd .FridayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .FridayNight
.FridayDay
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .NoYellow
	rematch 3, YELLOW, 6, 6, DOWN, ORANGE
.NoYellow
	endcallback
.FridayMorning
	rematch 1, SURGE, 6, 7, DOWN, BROWN
	endcallback
.FridayNight
	rematch 2, CLAIR, 2, 6, RIGHT, BLUE
	endcallback

.Saturday
	checktime 1 << MORN
	iftruefwd .SaturdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SaturdayNight
.SaturdayDay
	rematch 1, WHITNEY, 3, 6, RIGHT, RED
	rematch 2, CHUCK, 6, 6, LEFT, BROWN
	endcallback
.SaturdayMorning
	rematch 1, WHITNEY, 3, 6, RIGHT, RED
	endcallback
.SaturdayNight
	checkevent EVENT_BEAT_AGATHA
	iffalsefwd .NoAgatha
	rematch 3, AGATHA, 2, 4, DOWN, BROWN
.NoAgatha
	endcallback

FightingDojoBlackBelt:
	checkevent EVENT_BEAT_BLUE
	iftrue_jumptextfaceplayer BlackBeltText_ExplainsRematches
	jumpthistextfaceplayer

	text "¡Hola!"

	para "El Rey del"
	line "Karate, maestro"
	cont "del Dojo, está"
	cont "entrenando en"
	cont "una cueva de"
	cont "Johto."
	done

MapFightingDojoSignpost2Script:
	opentext
	writetext FightingDojoScheduleQuestionText
	yesorno
	iffalse_endtext
.sunday
	writetext FightingDojoScheduleSundayText
	waitbutton
.monday
	checkevent EVENT_BEAT_WALKER
	iftruefwd .monday_walker
	writetext FightingDojoScheduleMondayText
	waitbutton
	sjumpfwd .tuesday
.monday_walker
	writetext FightingDojoScheduleMondayWalkerText
	waitbutton
.tuesday
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iftruefwd .tuesday_lorelei
	writetext FightingDojoScheduleTuesdayText
	waitbutton
	sjumpfwd .wednesday
.tuesday_lorelei
	writetext FightingDojoScheduleTuesdayLoreleiText
	waitbutton
.wednesday
	writetext FightingDojoScheduleWednesdayText
	waitbutton
.thursday
	checkevent EVENT_BEAT_PALMER
	iftruefwd .thursday_palmer
	writetext FightingDojoScheduleThursdayText
	waitbutton
	sjumpfwd .friday
.thursday_palmer
	writetext FightingDojoScheduleThursdayPalmerText
	waitbutton
.friday
	checkevent EVENT_BEAT_YELLOW
	iftruefwd .friday_yellow
	writetext FightingDojoScheduleFridayText
	waitbutton
	sjumpfwd .saturday
.friday_yellow
	writetext FightingDojoScheduleFridayYellowText
	waitbutton
.saturday
	checkevent EVENT_BEAT_AGATHA
	iftruefwd .saturday_agatha
	jumpthisopenedtext

	text "Sábado: Blanca,"
	line "Aníbal, ???"
	done
.saturday_agatha
	jumpthisopenedtext

	text "Sábado: Blanca,"
	line "Aníbal, Agatha"
	done

BlackBeltText_ExplainsRematches:
	text "Líderes de"
	line "Gimnasio de Kanto"
	cont "y Johto vienen a"

	para "este Dojo de"
	line "Lucha a"
	cont "entrenar."

	para "¡Deberías unirte"
	line "a ellos!"
	done

FightingDojoSign1Text:
	text "¡Lo que va,"
	line "vuelve!"
	done

FightingDojoSign2Text:
	text "¡Enemigos por"
	line "todas partes!"
	done

MACRO rematch_script
	; rematch_script name, trainer, flag
	checkflag ENGINE_GYM_LEADER_REMATCH_\3
	iftrue_jumptextfaceplayer \1Text_Done
	faceplayer
	showtext \1Text_Greeting
	winlosstext \1Text_WinLoss, 0
	loadtrainer \2, 2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_GYM_LEADER_REMATCH_\3
	end
ENDM

FightingDojoRematch1Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Falkner
	ifequalfwd TUESDAY, .Pryce
	ifequalfwd WEDNESDAY, .Brock
	ifequalfwd THURSDAY, .Bugsy
	ifequalfwd FRIDAY, .Surge
	ifequalfwd SATURDAY, .Whitney

.Jasmine
	rematch_script Jasmine, JASMINE, 1

.Falkner
	rematch_script Falkner, FALKNER, 1

.Pryce
	rematch_script Pryce, PRYCE, 1

.Brock
	rematch_script Brock, BROCK, 1

.Bugsy
	rematch_script Bugsy, BUGSY, 1

.Surge
	rematch_script Surge, LT_SURGE, 1

.Whitney
	rematch_script Whitney, WHITNEY, 1

FightingDojoRematch2Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Janine
	ifequalfwd TUESDAY, .Blaine
	ifequalfwd WEDNESDAY, .Misty
	ifequalfwd THURSDAY, .Morty
	ifequalfwd FRIDAY, .Clair
	ifequalfwd SATURDAY, .Chuck

.Erika
	rematch_script Erika, ERIKA, 2

.Janine
	rematch_script Janine, JANINE, 2

.Blaine
	rematch_script Blaine, BLAINE, 2

.Misty
	rematch_script Misty, MISTY, 2

.Morty
	rematch_script Morty, MORTY, 2

.Clair
	rematch_script Clair, CLAIR, 2

.Chuck
	rematch_script Chuck, CHUCK, 2

FightingDojoRematch3Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Walker
	ifequalfwd TUESDAY, .Lorelei
	ifequalfwd WEDNESDAY, .Blue
	ifequalfwd THURSDAY, .Palmer
	ifequalfwd FRIDAY, .Yellow
	ifequalfwd SATURDAY, .Agatha

.Sabrina
	rematch_script Sabrina, SABRINA, 3

.Walker
	rematch_script Walker, WALKER, 3

.Lorelei
	rematch_script Lorelei, LORELEI, 3

.Blue
	rematch_script Blue, BLUE, 3

.Palmer
	rematch_script Palmer, TOWERTYCOON, 3

.Yellow
	rematch_script Yellow, YELLOW, 3

.Agatha
	rematch_script Agatha, AGATHA, 3

BrockText_Greeting:
	text "Me gustan los"
	line "#mon Roca."

	para "Son sólidos y"
	line "rugosos, pero"
	cont "frágiles a la"
	cont "vez."

	para "¡Verás cuánto"
	line "más fuertes se"
	cont "han vuelto mis"
	cont "#mon roca!"
	done

MistyText_Greeting:
	text "He oído muy"
	line "buenas cosas"

	para "de ti desde"
	line "nuestra última"
	cont "batalla."

	para "¡Veamos qué tan"
	line "buena eres!"
	done

SurgeText_Greeting:
	text "Siento un gran"
	line "poder eléctrico"

	para "¡En la estación"
	line "del Tren Imán!"

	para "¡Estoy listo para"
	line "una batalla"
	cont "eléctrica!"
	done

ErikaText_Greeting:
	text "¡Qué bueno"
	line "verte de nuevo!"

	para "¿Cómo estás?"

	para "Este lugar no me"
	line "queda muy bien,"
	cont "pero…"

	para "¡Olvidemos eso"
	line "y luchemos!"
	done

JanineText_Greeting:
	text "No puedo usar mi"
	line "técnica ninja,"

	para "¡pero no dejaré"
	line "que ganes!"
	done

SabrinaText_Greeting:
	text "Sabía que"
	line "vendrías a"
	cont "luchar de nuevo."

	para "Tuve un"
	line "presentimiento."
	done

BlaineText_Greeting:
	text "Mi Gimnasio"
	line "sigue destruido,"
	cont "¡así que"

	para "hagamos nuestra"
	line "revancha aquí"
	cont "mismo!"
	done

BlueText_Greeting:
	text "¡Bien! Tú"
	line "también estás"
	cont "aquí."

	para "¡Gracias por"
	line "venir a perder"
	cont "contra mí!"
	done

FalknerText_Greeting:
	text "Hoy estoy en"
	line "plena forma."

	para "¡Es un placer"
	line "poder luchar"
	cont "contigo de"
	cont "nuevo!"
	done

BugsyText_Greeting:
	text "¡Qué bueno"
	line "verte otra vez!"
	cont "¡Mira mi"
	cont "investigación"
	cont "de bichos!"
	done

WhitneyText_Greeting:
	text "¡Hola, <PLAYER>!"
	line "Ya que estamos"

	para "los dos aquí,"
	line "¡luchemos!"

	para "¿Estás lista?"
	done

MortyText_Greeting:
	text "El #mon"
	line "legendario no me"
	cont "eligió…"

	para "Pero eso no"
	line "significa que"
	cont "perdí mi futuro."

	para "¡Luchemos!"
	done

ChuckText_Greeting:
	text "¡Ahí estás!"

	para "¡Prueba mi"
	line "entrenamiento"
	cont "de 24 horas!"
	done

JasmineText_Greeting:
	text "Hola, <PLAYER>…"
	line "¿Cómo estás?"
	cont "Yo estoy bien…"

	para "Bueno, ¿Estás"
	line "lista para"
	cont "luchar de nuevo?"
	done

PryceText_Greeting:
	text "No hacen falta"
	line "palabras. Una"
	cont "batalla #mon"

	para "es nuestra forma"
	line "de comunicarnos."
	done

ClairText_Greeting:
	text "…Así que estás"
	line "aquí."

	para "¡Ahora luchemos!"
	done

PalmerText_Greeting:
	text "Vaya, ¡has"
	line "llegado tan"
	cont "lejos!"

	para "Como Magnate de"
	line "la Torre, debo"

	para "darte mi mejor"
	line "esfuerzo."

	para "Así es como los"
	line "mejores"
	cont "entrenadores"
	cont "muestran respeto"

	para "unos a otros."

	para "¡Luchando con"
	line "todo como"
	cont "estudiantes"
	cont "dedicados de los"
	cont "#mon!"
	done

LoreleiText_Greeting:
	text "Hola de nuevo,"
	line "<PLAYER>."

	para "Ahora estamos"
	line "en mi terreno."

	para "¡No perderé!"
	done

AgathaText_Greeting:
	text "Hola, criatura."

	para "¿Sigues"
	line "llenando una"
	cont "#dex para ese"

	para "viejo chocho de"
	line "Oak?"

	para "¡Los #mon son"
	line "para luchar!"

	para "¡Muéstrame tu"
	line "verdadero talento"
	cont "como entrenador!"
	done

WalkerText_Greeting:
	text "¡Hola,"
	line "<PLAYER>!"

	para "Parece que me"
	line "acabo de"
	cont "encontrar con mi"
	cont "hijo Pegaso"
	cont "aquí…"

	para "¿Qué tal si"
	line "luchamos en su"
	cont "lugar?"
	done

YellowText_Greeting:
	text "¡Hola, <PLAYER>!"

	para "Déjame ver…"

	para "¡Sí! ¡Sigues"
	line "cuidando bien"
	cont "de tus #mon!"

	para "¡Te has vuelto"
	line "más fuerte,"
	cont "pero yo"
	cont "también!"
	done

BrockText_WinLoss:
	text "He perdido de"
	line "nuevo…"

	para "¡No aventuras por"
	line "nada!"
	done

MistyText_WinLoss:
	text "¡Vaya! ¡Te"
	line "vuelves más"
	cont "fuerte con cada"
	cont "batalla!"
	done

SurgeText_WinLoss:
	text "¡Eres muy"
	line "fuerte!"

	para "¡Pero pagaré mi"
	line "deuda algún día!"
	done

ErikaText_WinLoss:
	text "Te has vuelto"
	line "aún más fuerte…"
	done

JanineText_WinLoss:
	text "Hoy perdí, ¡pero"
	line "ganaré la"
	cont "próxima!"
	done

SabrinaText_WinLoss:
	text "Lo sé… Nos"
	line "volveremos a"
	cont "ver."
	done

BlaineText_WinLoss:
	text "¡Aaah! ¡Me he"
	line "quemado de nuevo!"
	done

BlueText_WinLoss:
	text "¡Justo lo que"
	line "esperaba!"

	para "Con razón te has"
	line "vuelto el"
	cont "Campeón…"
	done

FalknerText_WinLoss:
	text "Mmm… Aún falta"
	line "mucho para ser"
	cont "el mejor"
	cont "entrenador…"
	done

BugsyText_WinLoss:
	text "¡Debiste haber"
	line "estudiado mucho"
	cont "sobre #mon!"
	done

WhitneyText_WinLoss:
	text "¡De verdad eres"
	line "fuerte!"

	para "¡Pero no perderé"
	line "la próxima vez!"
	done

MortyText_WinLoss:
	text "He perdido de"
	line "nuevo… Tienes"

	para "algo más que"
	line "fuerza."
	done

ChuckText_WinLoss:
	text "¡Jajaja!"
	line "¡Una batalla"
	cont "contigo nunca"
	cont "aburre!"
	done

JasmineText_WinLoss:
	text "Fiel a tu"
	line "reputación…"
	done

PryceText_WinLoss:
	text "Mmm… ¡Impresio-"
	line "nante!"
	done

ClairText_WinLoss:
	text "Bien hecho."
	line "…"

	para "¡Ahora da todo"
	line "tu esfuerzo!"
	done

PalmerText_WinLoss:
	text "¡Bravo! ¡Siento"
	line "inspiración en"
	cont "mi corazón!"
	done

LoreleiText_WinLoss:
	text "¡Cómo te atreves!"
	done

AgathaText_WinLoss:
	text "¡Yuju!"
	done

WalkerText_WinLoss:
	text "¡No fui rival"
	line "para ti!"
	done

YellowText_WinLoss:
	text "¡Jajaja!"
	done

BrockText_Done:
MistyText_Done:
SurgeText_Done:
ErikaText_Done:
JanineText_Done:
SabrinaText_Done:
BlaineText_Done:
BlueText_Done:
FalknerText_Done:
BugsyText_Done:
WhitneyText_Done:
MortyText_Done:
ChuckText_Done:
JasmineText_Done:
PryceText_Done:
ClairText_Done:
PalmerText_Done:
LoreleiText_Done:
AgathaText_Done:
WalkerText_Done:
YellowText_Done:
	text "Por hoy ya no"
	line "lucho más."
	done

FightingDojoScheduleQuestionText:
	text "¡Es un horario de"
	line "entrenamiento!"
	cont "¿Lo lees?"
	done

FightingDojoScheduleSundayText:
	text "Domingo: Yasmina,"
	line "Erika, Sabrina"
	done

FightingDojoScheduleMondayText:
	text "Lunes: Pegaso,"
	line "Janine, ???"
	done

FightingDojoScheduleMondayWalkerText:
	text "Lunes: Pegaso,"
	line "Janine, Walker"
	done

FightingDojoScheduleTuesdayText:
	text "Martes: Fredo,"
	line "Blaine, ???"
	done

FightingDojoScheduleTuesdayLoreleiText:
	text "Martes: Fredo,"
	line "Blaine, Lorelei"
	done

FightingDojoScheduleWednesdayText:
	text "Miércoles: Brock,"
	line "Misty, Blue"
	done

FightingDojoScheduleThursdayText:
	text "Jueves: Antón,"
	line "???, Morty"
	done

FightingDojoScheduleThursdayPalmerText:
	text "Jueves: Antón,"
	line "Palmer, Morty"
	done

FightingDojoScheduleFridayText:
	text "Viernes: Lt.Surge,"
	line "???, Débora"
	done

FightingDojoScheduleFridayYellowText:
	text "Viernes: Lt.Surge,"
	line "Yellow, Débora"
	done
