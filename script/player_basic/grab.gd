extends State

var can_grab := false
var teleport_box: RigidBody2D


func _enter() -> void:
	if !can_grab:
		state_machine.change_state(state_machine.previous_state)
	

func update(delta: float) -> void:
	if can_grab: 
		print("yes")


func _on_interaction_area_area_entered(area: Area2D) -> void:
	can_grab = true if area.is_in_group("teleport_box") else false
