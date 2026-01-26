extends Node2D

enum FacingDirection { 
	LEFT = -1, 
	RIGHT = 1 
}

var current_selected_player: CharacterBody2D
var player_basic_apply_gravity: bool
var player_basic_mid_air: bool
var can_climb: bool

var anime_sword_obtained := true
var healing_potion_obtained := false
var is_holding := false

var game_started := false
var game_paused := false

var push_trap_count := 0

var next_level_requirement := 0
var current_level := 0
var basic_level_positon_container := [
	Vector2(164.0, 291.0),
	Vector2(369.0, 780.0),
	Vector2(788.0, 525.0)
	]
var wizard_level_positon_container := [
	Vector2(310.0, 268.0),
	Vector2(292.0, 780.0),
	Vector2(779.0, 526.0)
	]
