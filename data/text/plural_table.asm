	; use rawchars so `plural` can reverse strings
	setcharmap no_ngrams

MACRO plural
	for i, CHARLEN(\1)
		db STRCHAR(\1, CHARLEN(\1) - 1 - i)
	endr
	db "@", \2, "@"
ENDM

PluralTable:
	; Spanish pluralization: words ending in a vowel just add "s"; words
	; ending in a consonant add "es" (the "" catch-all below). A few fixed
	; multi-word items and abbreviation-style names are special-cased since
	; the general rule doesn't apply to them (e.g. names ending "PP", or
	; already-plural-looking words). Order matters: more specific endings
	; must come before shorter ones they're a subset of (e.g. "z" before "").
	plural "z",         "ces"        ; e.g. Baya Ziuela -> ...ces (safety net)
	plural "Ball",      "Balls"      ; Poké Ball, Master Ball, etc.
	plural "PP",        "PP"         ; Más PP, Máx PP (already implicitly plural)
	plural "PS",        "PS"         ; Más PS
	plural "GBC",       "GBC"        ; Sonido GBC
	plural "a",         "as"
	plural "e",         "es"
	plural "i",         "is"
	plural "o",         "os"
	plural "u",         "us"
	plural "á",         "ás"
	plural "é",         "és"
	plural "í",         "ís"
	plural "ó",         "ós"
	plural "ú",         "ús"
	plural "",          "es"         ; everything else (consonant endings)

	setcharmap default
