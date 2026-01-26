extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D


func _process(delta: float) -> void:
	if GlobalState.push_trap_count == 4:
		print("yes")
		collision_shape_2d.disabled = true
		sprite_2d.modulate = Color(1.0, 1.0, 1.0, 0.275)
	else:
		collision_shape_2d.disabled = false
		sprite_2d.modulate = Color.WHITE
		
	
