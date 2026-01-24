extends CharacterBody2D

@export var friction := 27
@export var knockback_strength := 30.0
@export var knockback_up := 30.0
@export var gravity := 90.0

var is_being_pushed := false
var hit := false
var hit_direction := GlobalState.FacingDirection.RIGHT


func _physics_process(delta: float) -> void:
	if hit:
		apply_impulse(hit_direction)
		hit = false

	if !is_being_pushed: velocity.x = move_toward(velocity.x, 0.0, friction * delta)
	if !is_on_floor():   velocity.y += gravity * delta

	move_and_slide()
	is_being_pushed = false


func apply_impulse(direction: GlobalState.FacingDirection) -> void:
	is_being_pushed = true
	velocity.x = direction * knockback_strength
	velocity.y = -knockback_up
