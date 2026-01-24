extends StateMachine


func update_facing_direction(direction_horizontal: float) -> void:
	var tmp = player.hit_collider.position.x
	if direction_horizontal > 0:
		player.flipbook.flip_h = false
		player.hit_collider.position.x = -tmp if tmp < 0 else tmp
	elif direction_horizontal < 0:
		player.flipbook.flip_h = true
		player.hit_collider.position.x = -tmp if tmp > 0 else tmp
