class_name StateMachine extends Node2D

@export var player: CharacterBody2D

var states: Dictionary
var previous_state: State
var current_state: State


func init(initial_state: State) -> void:
	for child in self.get_children():
		if child is State:
			states[child.name] = child
			child.player = player
			child.state_machine = self
	
	current_state = initial_state
	current_state.enter()
	

func update(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func update_facing_direction(direction_horizontal: float) -> void:
	if direction_horizontal > 0:
		player.flipbook.flip_h = false
	elif direction_horizontal < 0:
		player.flipbook.flip_h = true


func change_state(new_state: State) -> void:
	if current_state == new_state:
		return
	
	current_state.exit()
	previous_state = current_state
	current_state = new_state
	current_state.enter()
