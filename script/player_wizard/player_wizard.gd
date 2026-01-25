extends CharacterController

@export var move_speed_horizontal := 30
@export var move_speed_vertical := 0
@export var jump_force := -30
@export var gravity := 90

var teleport_visual := false
var teleport_object_container: Array[CharacterBody2D]
var teleport_object_current_index := -1
var magic_color := Color(1.5, 1.5, 1.5)


func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if not self.is_on_floor() and GlobalState.player_basic_apply_gravity:
		self.velocity += Vector2(0, self.gravity) * delta
	self.move_and_slide()
