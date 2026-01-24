extends State


func enter() -> void:
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_run")
	else:
		player.flipbook.play("run")
	

func update(delta: float) -> void:
	state_machine.update_facing_direction(player.direction_horizontal)
	
	for i in range(player.get_slide_collision_count()):
		var collision := player.get_slide_collision(i)
		var box := collision.get_collider()

		if box is CharacterBody2D and box.is_in_group("pushable"):
			var normal := collision.get_normal()

			if abs(normal.x) > 0.9 and player.direction_horizontal != 0:
				box.velocity.x = player.direction_horizontal * (player.push_force)
				box.is_being_pushed = true
	
	if player.direction_horizontal == 0:
		state_machine.change_state(state_machine.get_node("Idle"))
	elif !player.is_on_floor():
		state_machine.change_state(state_machine.get_node("MidAir"))
	elif Input.is_action_pressed("jump"):
		state_machine.change_state(state_machine.get_node("Jump"))
	elif Input.is_action_pressed("attack"):
		state_machine.change_state(state_machine.get_node("Attack"))
		
	player.velocity.x = player.direction_horizontal * player.move_speed_horizontal
