extends Node

func _ready():
	if not InputMap.has_action("highlight_bubbles"):
		InputMap.add_action("highlight_bubbles")
		var event = InputEventKey.new()
		event.keycode = KEY_H
		InputMap.action_add_event("highlight_bubbles", event)
