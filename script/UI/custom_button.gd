@tool
extends TextureButton

@onready var label: Label = $Label
@onready var selector: Label = $Selector

@export var menu_name: String


func setup_text(label_name: String) -> void:
	label.text = label_name

func _ready():
	selector.visible = false
	setup_text(menu_name)
	

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		setup_text(menu_name)
	

func _on_focus_entered() -> void:
	selector.visible = true
	label.modulate = Color.WHITE


func _on_focus_exited() -> void:
	selector.visible = false
	label.modulate = Color("c2c2c284")
