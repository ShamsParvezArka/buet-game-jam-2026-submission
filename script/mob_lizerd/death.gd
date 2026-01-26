extends State


func enter() -> void:
	player.flipbook.play("death")
	player.set_collision_mask_value(1, false)
	player.velocity.y = player.jump_force
