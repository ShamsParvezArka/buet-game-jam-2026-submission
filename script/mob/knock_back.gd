extends State

@export var friction := 22
@export var knockback_strength := 38.0
@export var knockback_up := 30.0


func apply_impulse(direction: GlobalState.FacingDirection) -> void:
	player.velocity.x = direction * knockback_strength
	player.velocity.y = -knockback_up
	

func enter() -> void:
	print("knock back entered")
	player.flipbook.play("knock_back")
	apply_impulse(player.hit_direction)
	

func update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0.0, friction * delta)

	if player.is_on_floor():
		state_machine.change_state(state_machine.get_node("Idle"))
		player.is_hurt = false
