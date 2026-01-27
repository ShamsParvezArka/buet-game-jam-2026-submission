extends Node2D


func _on_timer_timeout() -> void:
	self.get_tree().change_scene_to_file("res://scene/Main_Menu.tscn")
