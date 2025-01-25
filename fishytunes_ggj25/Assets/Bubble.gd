extends Node2D

var starting_position : Vector2
@export var size : int
@export var correct : bool
@onready var note = $Note
@onready var trash = $Trash

func _on_body_entered(player: Fish) -> void:
	if(correct == true):
		note.play()
		hide()
	else:
		trash.play()
		player.die()
