extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var main_camera: Camera2D = $"../CameraRig"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):

		animation_player.play("level0_cut_scene")
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "level0_cut_scene":
		pass
