extends Node2D

enum FacingDirection { LEFT, RIGHT }

var current_selected_player: CharacterBody2D
var anime_sword_obtained: bool
var player_basic_apply_gravity: bool
var player_basic_mid_air: bool
var can_climb: bool
