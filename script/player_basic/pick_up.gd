extends State

var can_pickup := false
var object: StaticBody2D

func enter() -> void:
	if !can_pickup:
		state_machine.change_state(state_machine.previous_state)
	

func update(delta: float) -> void:
	if can_pickup:
		object.queue_free()
		can_pickup = false
		state_machine.change_state(state_machine.previous_state)
	

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("collectable"):
		print("collectable")
		can_pickup = true
		object = body
