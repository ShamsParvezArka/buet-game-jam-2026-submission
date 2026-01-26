extends Area2D

@onready var audio_stream: Node2D = $AudioStream


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		audio_stream.play("Wind")
