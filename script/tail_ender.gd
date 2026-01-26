extends Area2D

@onready var player_basic: CharacterBody2D = $"../PlayerBasic"
@onready var player_wizard: CharacterBody2D = $"../PlayerWizard"


func _process(delta: float) -> void:
	if GlobalState.next_level_requirement == 2:
		player_basic.position = GlobalState.basic_level_positon_container[GlobalState.current_level]
		player_wizard.position = GlobalState.wizard_level_positon_container[GlobalState.current_level]
		GlobalState.current_selected_player = player_basic
		return 
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("detected")
		GlobalState.next_level_requirement += 1
	if GlobalState.next_level_requirement == 2:
		GlobalState.current_level += 1
		

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalState.next_level_requirement -= 1
