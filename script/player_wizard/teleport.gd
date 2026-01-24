extends State

var object: CharacterBody2D
var super_magic_value := -1.0


func enter() -> void:
	if object == null:
		state_machine.change_state(state_machine.previous_state)
		return
	

func update(delta: float) -> void:
	if object != null:
		var tmp := object.position + Vector2(0.0, super_magic_value)
		object.position = player.position
		player.position = tmp
		
		state_machine.change_state(state_machine.get_node("Idle"))
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		object = body
		player.teleport_visual = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		object = null
		player.teleport_visual = false
