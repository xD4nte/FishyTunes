extends ColorRect

signal transition_completed

func _ready():
	color.a = 0
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func fade_in():
	var tween = create_tween()
	tween.tween_property(self, "color:a", 1.0, 0.5)
	await tween.finished
	emit_signal("transition_completed")

func fade_out():
	var tween = create_tween()
	tween.tween_property(self, "color:a", 0.0, 0.5)
	await tween.finished
	emit_signal("transition_completed") 
