extends State

var can_teleport := false
var object: CharacterBody2D
var super_magic_value := -1.0


func enter() -> void:
	if !can_teleport:
		state_machine.change_state(state_machine.previous_state)
	

func update(delta: float) -> void:
	if object != null:
		var tmp := object.position + Vector2(0.0, super_magic_value)
		object.position = player.position
		player.position = tmp
		
		state_machine.change_state(state_machine.get_node("Idle"))
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		object = body
		can_teleport = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	can_teleport = false
