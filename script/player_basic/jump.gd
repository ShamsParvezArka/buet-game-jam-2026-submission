extends State

@onready var timer: Timer = $Timer


func enter() -> void:
	player.velocity.y = player.jump_force
	timer.start()	
	player.flipbook.play("jump")
	

func update(delta: float) -> void:
	state_machine.update_facing_direction(player.direction_horizontal)
	
	player.velocity.x = player.direction_horizontal * player.move_speed_horizontal
			

func _on_timer_timeout() -> void:
	if player.is_on_floor():
		if player.direction_horizontal != 0:
			state_machine.change_state(state_machine.get_node("Run"))
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed_horizontal)
			state_machine.change_state(state_machine.get_node("Idle"))
	else:
		state_machine.change_state(state_machine.get_node("MidAir"))
