extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = ""

func _on_mob_lizerd_timer_timeout() -> void:
	self.text = ""


func _on_mob_mooseman_timer_timeout() -> void:
	self.text = ""
