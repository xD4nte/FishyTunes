extends Node2D

signal bubble_completed(bubble)

var starting_position : Vector2
@export var size : int
@export var correct : bool
@onready var note = $Note
@onready var trash = $Trash

func _on_body_entered(player: Fish) -> void:
	if correct:
		note.play()
		hide()
		emit_signal("bubble_completed", self)
	else:
		trash.play()
		player.die()
