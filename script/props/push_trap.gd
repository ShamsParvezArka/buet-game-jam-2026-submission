extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D


func _on_trap_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("pushable"):
		sprite_2d.frame = 1
		GlobalState.push_trap_count += 1
	

func _on_trap_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("pushable"):
		sprite_2d.frame = 0
		GlobalState.push_trap_count -= 1


func _on_trap_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") or area.is_in_group("pushable"):
		sprite_2d.frame = 1
		GlobalState.push_trap_count += 1


func _on_trap_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("player") or area.is_in_group("pushable"):
		sprite_2d.frame = 0
		GlobalState.push_trap_count -= 1
