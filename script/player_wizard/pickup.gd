extends State

var object: StaticBody2D

func enter() -> void:
	if object == null:
		state_machine.change_state(state_machine.previous_state)
		return
	
	player.audio_stream.play("PickUp")
	object.queue_free()
	object = null
	state_machine.change_state(state_machine.previous_state)
		

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("collectable"):
		if body.name == "HoveringSword":
			GlobalState.anime_sword_obtained = true
		object = body
		
		
func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body == object:
		object = null
