extends CharacterController

@export var move_speed_horizontal := 23
@export var move_speed_vertical := 0
@export var gravity := 90
@export var health:= 100
@export var jump_force := -38

var target: CharacterBody2D = null
var target_distance := 9.0
var is_hurt := false
var is_hit := false
var hit_direction := GlobalState.FacingDirection.LEFT
var is_falling_back = false


func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if !self.is_on_floor():
		self.velocity += Vector2(0, self.gravity) * delta
	self.move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = body


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = null
		
