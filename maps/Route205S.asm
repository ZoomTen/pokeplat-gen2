	object_const_def ; object_event constants

Route205S_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route205S_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12,  4, ETERNA_FOREST_INT, 1
	warp_event 13,  4, ETERNA_FOREST_INT, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
