extends StateMachine


func update_facing_direction(direction_horizontal: float) -> void:
	if player.target == null:
		return 

	if player.position.x < player.target.position.x:
		player.flipbook.flip_h = false
	else:
		player.flipbook.flip_h = true
