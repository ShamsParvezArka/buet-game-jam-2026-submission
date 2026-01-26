extends Control

func _on_startbtn_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/tutorial.tscn")


func _on_exitbtn_pressed() -> void:
	get_tree().quit()
