extends State

@onready var timer: Timer = $Timer

func enter() -> void:
	timer.start()
	player.audio_stream.play("Death")
	player.flipbook.play("mid_air")
	player.set_collision_mask_value(1, false)
	player.velocity.y = player.jump_force


func _on_timer_timeout() -> void:
	player.position = GlobalState.basic_level_positon_container[GlobalState.current_level]
	player.velocity = Vector2.ZERO
	player.set_collision_mask_value(1, true)
	state_machine.change_state(state_machine.get_node("Idle"))
	player.health = 100

	
