CeruleanBikeShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 8
	warp_event  3,  7, CERULEAN_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopClerkScript, -1

CeruleanBikeShopClerkScript:
	showtextfaceplayer CeruleanBikeShopClerkText
	turnobject LAST_TALKED, UP
	end

CeruleanBikeShopClerkText:
	text "Hace mucho, un"
	line "chico genial montó"
	cont "mi Bici por ahí,"

	para "y eso empezó un"
	line "boom de bicis."

	para "Entonces decidí"
	line "abrir una sucursal"
	cont "en Ciudad Trigal."

	para "¡Y se vendían"
	line "como churros!"

	para "Pero ya nadie"
	line "viene a esta"
	cont "tienda."

	para "Solo me queda"
	line "un inflador de"
	cont "bicis…"

	para "¿Debería vender"
	line "cámaras de aire?"
	done
