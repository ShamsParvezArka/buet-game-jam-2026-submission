extends Node2D

@onready var water: GPUParticles2D = $Water

@export var height := 0.89
@export var amount_ratio := 1.0


func _process(delta: float) -> void:
	water.lifetime = height
	water.amount_ratio = amount_ratio
