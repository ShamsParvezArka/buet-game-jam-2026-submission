extends Control


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$VBoxContainer/Start.grab_focus()
	

func _on_start_pressed() -> void:
	self.get_tree().change_scene_to_file("res://scene/game_manager.tscn")
	

func _on_exit_pressed() -> void:
	self.get_tree().quit()
