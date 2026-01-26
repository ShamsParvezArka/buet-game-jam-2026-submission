extends State

func enter() -> void:
	player.flipbook.play("mid_air")
	player.set_collision_mask_value(1, false)
	player.velocity.y = player.jump_force
	player.audio_stream.play("Death")
