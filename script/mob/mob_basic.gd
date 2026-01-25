extends CharacterController

@export var move_speed_inverse_horizontal := 70
@export var move_speed_vertical := 0
@export var gravity := 90

var target: CharacterBody2D = null
var target_distance := 11.0
var player_has_hit := false
var hit_direction := GlobalState.FacingDirection.LEFT


func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if !self.is_on_floor():
		self.velocity += Vector2(0, self.gravity) * delta
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = body


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = null
		
