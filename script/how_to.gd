extends Node2D

@onready var d: Sprite2D = $D
@onready var s: Sprite2D = $S
@onready var a: Sprite2D = $A
@onready var w: Sprite2D = $W


func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		a.frame = 229
	elif Input.is_action_just_released("move_left"):
		a.frame = 230
	
	if Input.is_action_pressed("move_right"):
		d.frame = 166
	elif Input.is_action_just_released("move_right"):
		d.frame = 167
	
	if Input.is_action_pressed("move_up"):
		w.frame = 39
	elif Input.is_action_just_released("move_up"):
		w.frame = 40

	if Input.is_action_pressed("move_down"):
		s.frame = 73
	elif Input.is_action_just_released("move_down"):
		s.frame = 74
	
