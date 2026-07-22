TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 1
	dr Normal
	dr Fighting
	dr Flying
	dr Poison
	dr Ground
	dr Rock
	dr Bug
	dr Ghost
	dr Steel
	assert_table_length SPECIAL_TYPES
	dr Fire
	dr Water
	dr Grass
	dr Electric
	dr Psychic
	dr Ice
	dr Dragon
	dr Dark
	dr Fairy
	dr UnknownType
	assert_table_length NUM_TYPES

EggGroupNames:
; entries correspond to egg groups (see constants/pokemon_data_constants.asm)
; placed here because several egg groups use the same string as a type
	table_width 1
	dr Monster
	dr Water1
	dr Bug
	dr Flying
	dr Field
	dr Fairy
	dr Grass
	dr Humanlike
	dr Water3
	dr Mineral
	dr Amorphous
	dr Water2
	dr Ditto
	dr Dragon
	dr Undiscovered
	assert_table_length NUM_EGG_GROUPS

Normal:      db "Normal@"
Fighting:    db "Lucha@"
Flying:      db "Volador@"
Poison:      db "Veneno@"
Ground:      db "Tierra@"
Rock:        db "Roca@"
Bug:         db "Bicho@"
Ghost:       db "Fantasma@"
Steel:       db "Acero@"
Fire:        db "Fuego@"
Water:       db "Agua@"
Grass:       db "Planta@"
Electric:    db "Eléctrico@"
Psychic:     db "Psíquico@"
Ice:         db "Hielo@"
Dragon:      db "Dragón@"
Dark:        db "Siniestro@"
Fairy:       db "Hada@"
UnknownType: db "???@"

Monster:      db "Monstruo@"
Field:        db "Campo@"
Humanlike:    db "Humanoide@"
Mineral:      db "Mineral@"
Amorphous:    db "Amorfo@"
Ditto:        db "Ditto@"
Undiscovered: db "Desconocido@"
if !DEF(FAITHFUL)
Water1:       db "Anfibio@"
Water2:       db "Pez@"
Water3:       db "Invertebrado@"
else
Water1:       db "Agua 1@"
Water2:       db "Agua 2@"
Water3:       db "Agua 3@"
endc
