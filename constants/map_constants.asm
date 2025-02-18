newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup ; Pokemon Center/Cable Club                          ;  1

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4
	map_const MOBILE_TRADE_ROOM,                            5,  4 ;  5
	map_const MOBILE_BATTLE_ROOM,                           5,  4 ;  6
	map_const DEBUG_ROOM,                                  26, 13 ;  7

	newgroup ; Twinleaf & Routes                                  ;  2

	map_const TWINLEAF_TOWN,                               10, 10 ;  1
	map_const ROUTE_201,                                   30,  9 ;  2
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  3
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  4
	map_const RIVAL_HOUSE_1F,                               5,  4 ;  5
	map_const RIVAL_HOUSE_2F,                               4,  3 ;  6
	map_const TWINLEAF_HOUSE_1,                             4,  4 ;  7
	map_const TWINLEAF_HOUSE_2,                             4,  4 ;  8

	newgroup ; Sandgem & Routes                                   ;  3

	map_const SANDGEM_TOWN,                                13, 10 ;  1
	map_const ROUTE_202,                                   10, 10 ;  2
	map_const ROUTE_219,                                   11, 11 ;  3
	map_const ROWANS_LAB,                                   8,  6 ;  4
	map_const SANDGEM_HOUSE_1,                              4,  4 ;  5
	map_const ASSISTANT_HOUSE_1F,                           5,  4 ;  6
	map_const ASSISTANT_HOUSE_2F,                           4,  3 ;  7
	map_const SANDGEM_POKEMON_CENTER_1F,                    5,  4 ;  8
	map_const SANDGEM_POKEMART,                             6,  4 ;  9

	newgroup ; Jubilife & Routes                                  ;  4

	map_const JUBILIFE_CITY,                               20, 20 ;  1
	map_const ROUTE_203,                                   29, 10 ;  2
	map_const ROUTE_204_S,                                 12, 21 ;  3
	map_const JUBILIFE_APARTMENT_SE_1F,                     6,  4 ;  4
	map_const JUBILIFE_APARTMENT_SE_2F,                     6,  4 ;  5
	map_const JUBILIFE_APARTMENT_NE_1F,                     6,  4 ;  6
	map_const JUBILIFE_APARTMENT_NE_2F,                     6,  4 ;  7
	map_const JUBILIFE_APARTMENT_SW_1F,                     6,  4 ;  8
	map_const JUBILIFE_APARTMENT_SW_2F,                     6,  4 ;  9
	map_const TRAINERS_SCHOOL,                              7,  4 ; 10
	map_const POKETCH_COMPANY_1F,                           6,  4 ; 11
	map_const POKETCH_COMPANY_2F,                           6,  4 ; 12
	map_const POKETCH_COMPANY_3F,                           6,  4 ; 13
	map_const TV_STATION_1F,                                8,  5 ; 14
	map_const TV_STATION_2F,                                7,  5 ; 15
	map_const TV_STATION_2F2,                               7,  5 ; 16
	map_const TV_STATION_3F,                                7,  5 ; 17
	map_const TV_STATION_3F2,                               5,  3 ; 18
	map_const TV_STATION_3F3,                               5,  3 ; 19
	map_const TV_STATION_4F,                                7,  5 ; 20
	map_const TV_STATION_ELEVATOR,                          2,  2 ; 21
	map_const POKEMON_COMMUNICATION_CENTER,                16, 16 ; 22
	map_const JUBILIFE_POKEMON_CENTER_1F,                   5,  4 ; 23
	map_const JUBILIFE_POKEMART,                            6,  4 ; 24
	
	newgroup ; Oreburgh & Routes                                     5
	
	map_const OREBURGH_CITY,                               25, 20 ;  1
	map_const ROUTE_207,                                   27, 10 ;  2
	map_const OREBURGH_POKEMON_CENTER_1F,                   5,  4 ;  3
	map_const OREBURGH_POKEMART,                            6,  4 ;  4
	map_const OREBURGH_GYM,                                 5, 10 ;  5
	map_const OREBURGH_APARTMENT_NW_1F,                     6,  4 ;  6
	map_const OREBURGH_APARTMENT_NW_2F,                     6,  4 ;  7
	map_const OREBURGH_APARTMENT_N_1F,                      6,  4 ;  8
	map_const OREBURGH_APARTMENT_N_2F,                      6,  4 ;  9
	map_const OREBURGH_APARTMENT_E_1F,                      6,  4 ; 10
	map_const OREBURGH_APARTMENT_E_2F,                      6,  4 ; 11
	map_const OREBURGH_HOUSE_W,                             4,  4 ; 12
	map_const OREBURGH_HOUSE_N,                             4,  4 ; 13
	map_const OREBURGH_HOUSE_E,                             4,  4 ; 14
	map_const OREBURGH_MUSEUM,                              8,  5 ; 15
	map_const ROUTE_206,                                   14, 43 ; 16
	map_const ROUTE_206_S_GATE, 							5,  5 ; 17
	map_const ROUTE_206_N_GATE, 							5,  5 ; 18
	
	newgroup ; Canalave, Route 218 & Islands                         6
	
	map_const JUBILIFE_WEST_GATE,                           5,  4 ;  1
	map_const ROUTE_218,                                   22, 12 ;  2
	map_const CANALAVE_EAST_GATE,                           5,  4 ;  3
	
	newgroup ; Floaroma, Eterna, Routes                              7
	map_const ROUTE_204_N,                                 12, 21 ;  1
	map_const FLOAROMA_TOWN,                               14, 14 ;  2
	map_const FLOAROMA_POKEMON_CENTER_1F,                   5,  4 ;  3
	map_const FLOAROMA_POKEMART,                            6,  4 ;  4
	map_const FLOAROMA_HOUSE_W,                             4,  4 ;  5
	map_const FLOAROMA_HOUSE_E,                             4,  4 ;  6
	map_const FLOAROMA_FLOWER_SHOP,                         5,  3 ;  7
	map_const ROUTE_205_S,                                 14, 25 ;  8
	map_const ROUTE_205_HOUSE,							    4,  4 ;  9
	map_const VALLEY_WINDWORKS_EXT,                        13, 13 ; 10
	map_const VALLEY_WINDWORKS_INT,						    9,  5 ; 11
	map_const ETERNA_FOREST_EXT,                           17, 17 ; 12
	map_const ROUTE_205_N,                                 14, 12 ; 13
	map_const FUEGO_IRONWORKS_EXT,                         10, 10 ; 14
	map_const ETERNA_CITY,                                 25, 22 ; 15
	map_const ETERNA_POKEMON_CENTER_1F,						5,  4 ;  16
	map_const ETERNA_POKEMART, 								6,  4 ;  17
	map_const ETERNA_GYM,									5,  5 ;  18
	map_const ETERNA_BIKE_SHOP,								5,  4 ;  19
	map_const ETERNA_HERB_SHOP,								4,  3 ;  20
	map_const ETERNA_UNDERGROUND_HOUSE,						4,  3 ;  21
	map_const ETERNA_APARTMENT_1F,							6,  4 ;  22
	map_const ETERNA_APARTMENT_2F,							6,  4 ;  23
	map_const ETERNA_APARTMENT_3F,							6,  4 ;  24
	map_const ETERNA_HOUSE_W,								4,  4 ;  25
	map_const ETERNA_HOUSE_E,								4,  4 ;  26
	map_const ROUTE_211_W,                                 12, 12 ; 16
	
	newgroup ; Floaroma Meadow                                    ;  8
	map_const FLOAROMA_MEADOW,                             20, 20 ;  1
	map_const FLOAROMA_MEADOW_HOUSE,                        4,  4 ;  2
	
	newgroup ; Lakes & Caverns                                       9
	
	map_const LAKE_VERITY_LOW,                             17, 12 ;  1
	map_const LAKE_VERITY_HIGH,                            17, 12 ;  2
	map_const LAKE_VERITY_CAVERN,                          10, 10 ;  3

	newgroup ; Dungeons                                             10
	
	map_const RAVAGED_PATH,                                11, 16 ;  1
	map_const OREBURGH_GATE_1F, 						   15, 10 ;  2
	map_const OREBURGH_GATE_B1F,                           25,  9 ;  3
	map_const OREBURGH_MINE_B1F,                            8, 12 ;  4
	map_const OREBURGH_MINE_B2F,                           14, 13 ;  5
	map_const ETERNA_FOREST_INT,                           30, 30 ;  6
	map_const ETERNA_GALACTIC_BUILDING_1F, 					9,  6 ;  7
	map_const ETERNA_GALACTIC_BUILDING_2F, 					8,  5 ;  8
	map_const ETERNA_GALACTIC_BUILDING_3F, 					8,  5 ;  9
	map_const ETERNA_GALACTIC_BUILDING_4F, 					8,  4 ;  10
	map_const OLD_CHATEAU_ENTRYWAY,                        19,  6 ;  11
	map_const OLD_CHATEAU_DINING,                          15,  5 ;  12
	map_const OLD_CHATEAU_BEDROOMS,                        17,  8 ;  13
	map_const FUEGO_IRONWORKS_INT,                         25, 13 ;  14
	