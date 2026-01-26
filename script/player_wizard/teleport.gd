extends State

var super_magic_value := -1.0
var swap_time := 0.0
var interpolation_factor := 6.0
var player_start: Vector2
var object_start: Vector2
var player_target: Vector2
var object_target: Vector2

var object: CharacterBody2D

func swap_position(object1: Node2D, object2: Node2D):
	var tmp := object1.position + Vector2(0.0, super_magic_value)
	object1.position = lerp(object1.position, object2.position + Vector2(0.0, super_magic_value), 0.2) 
	object2.position = lerp(object2.position, tmp, 0.2)


func enter() -> void:
	if player.teleport_object_container.is_empty():
		state_machine.change_state(state_machine.previous_state)
		return
	
	player.audio_stream.play("Teleport")
	
	object = player.teleport_object_container[player.teleport_object_current_index]
	swap_time = 0
	player_start = player.position
	object_start = object.position
	player_target = object.position + Vector2(0.0, super_magic_value)
	object_target = player.position + Vector2(0.0, super_magic_value)
	

func update(delta: float) -> void:
	swap_time += delta * interpolation_factor
	swap_time = clamp(swap_time, 0.0, 1.0)

	var eased_t := ease(swap_time, 0.1)

	player.position = player_start.lerp(player_target, eased_t)
	object.position = object_start.lerp(object_target, eased_t)

	if swap_time >= 1.0:
		state_machine.change_state(state_machine.get_node("Idle"))	
	

func focus_on_new_object() -> void:
	for idx in range(player.teleport_object_container.size()):
		if idx == player.teleport_object_current_index:
			player.teleport_object_container[idx].modulate = player.magic_color
		else:
			player.teleport_object_container[idx].modulate = Color(1.0, 1.0, 1.0, 1.0)


func exit() -> void:
	player.audio_stream.stop("Teleport")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		player.teleport_object_container.append(body)
		player.teleport_object_current_index = player.teleport_object_container.size() - 1
		focus_on_new_object()
		player.teleport_visual = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		body.modulate = Color.WHITE
		player.teleport_object_current_index -= 1
		player.teleport_object_current_index = clamp(
			player.teleport_object_current_index, 
			0, 
			player.teleport_object_container.size() - 1)
		player.teleport_object_container.erase(body)

	if player.teleport_object_container.is_empty():
		player.teleport_visual = false
