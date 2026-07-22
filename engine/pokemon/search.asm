SpecialBeastsCheck::
; Check if the player has caught all three legendary beasts.
; Return the result in hScriptVar.

	ld a, [wPlayerCaught]
	or ~CAUGHT_BEASTS_MASK
	inc a
	jr nz, SpecialMonCheckFailed
	ld a, 1
	ldh [hScriptVar], a
	ret

SpecialBirdsCheck::
; Check if the player has caught all three legendary birds.
; Return the result in hScriptVar.

	ld a, [wPlayerCaught]
	or ~CAUGHT_BIRDS_MASK
	inc a
	jr nz, SpecialMonCheckFailed
	ld a, 1
	ldh [hScriptVar], a
	ret

SpecialDuoCheck:
; Check if the player has caught Lugia and Ho-Oh.
; Return the result in hScriptVar.

	ld a, [wPlayerCaught]
	or ~CAUGHT_DUO_MASK
	inc a
	jr nz, SpecialMonCheckFailed
	ld a, 1
	ldh [hScriptVar], a
	ret

SpecialMonCheckFailed:
	xor a
	ldh [hScriptVar], a
	ret

CheckBattleCaughtResult:
	ld a, [wBattleResult]
	and 1 << BATTLERESULT_CAUGHT_POKEMON_F
	rlca
	rlca
	ldh [hScriptVar], a
	ret

.false
	xor a
	ldh [hScriptVar], a
	ret

CheckPartyNotFull::
; Return true (room to spare) in hScriptVar if the party isn't full yet.
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .full
	ld a, 1
	ldh [hScriptVar], a
	ret

.full
	xor a
	ldh [hScriptVar], a
	ret

MarkLastCaughtPartymonShiny::
; The wild encounter's shininess is rolled inside the shared battle engine,
; with no script-level hook to force it beforehand. Since CheckPartyNotFull
; guarantees a caught mon always lands in the party (never the PC box), we
; can safely patch its Shiny bit here afterward using the existing shiny
; palette instead - same idea as the mid-battle personality byte, just
; edited a few frames later than usual.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
	call GetPartyLocation
	ld bc, wPartyMon1Shiny - wPartyMon1
	add hl, bc
	set 7, [hl] ; SHINY_MASK
	ret
