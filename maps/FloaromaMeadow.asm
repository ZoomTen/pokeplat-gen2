	object_const_def ; object_event constants

FloaromaMeadow_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaMeadow_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 33, FLOAROMA_TOWN, 6
	warp_event  9, 33, FLOAROMA_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
