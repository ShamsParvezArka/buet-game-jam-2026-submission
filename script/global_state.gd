extends Node2D

enum FacingDirection 
{ 
	LEFT = -1, 
	RIGHT = 1 
}

var current_selected_player: CharacterBody2D
var player_basic_apply_gravity: bool
var player_basic_mid_air: bool
var can_climb: bool

var anime_sword_obtained := false
var is_holding := false
