extends Node2D

@onready var player: CharacterBody2D = $".."
@onready var collider: CollisionShape2D = $"../Area2D/Collider"

@export var teleport_radius: float
@export var color := Color("ea4a6e32")
@export var thickness := 0.3
@export var grow_speed := 4.0

var current_radius := 0.0
var target_radius := 0.0


func _ready() -> void:
	target_radius = collider.shape.radius
	current_radius = 0.0


func focus_selected_object(object_index: int) -> void:
	for i in range(player.teleport_object_container.size()):
		var object = player.teleport_object_container[i]
		if i == object_index:
			object.modulate = player.magic_color
		else:
			object.modulate = Color.WHITE


func _process(delta: float) -> void:
	if !player.teleport_visual:
		if current_radius > 0.0:
			current_radius = lerp(current_radius, 0.0, grow_speed * delta)
			queue_redraw()
		return
		
	current_radius = lerp(current_radius, target_radius, grow_speed * delta)
	queue_redraw()
	
	if Input.is_action_just_pressed("target_switch") and !player.teleport_object_container.is_empty():
		var idx = player.teleport_object_current_index
		var size = player.teleport_object_container.size()
		player.teleport_object_current_index = (idx + 1) % size
		clamp(player.teleport_object_current_index, 0, size)
	
	focus_selected_object(player.teleport_object_current_index)

func _draw() -> void:
	if current_radius < 6.0:
		return

	draw_arc(
		Vector2.ZERO,
		current_radius,
		0.0,
		TAU,
		64,
		color,
		thickness
	)
