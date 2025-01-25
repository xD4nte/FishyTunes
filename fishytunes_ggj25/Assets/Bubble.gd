extends Node2D

var starting_position : Vector2
@export var size : int
@export var correct : bool
@onready var asp = $AudioStreamPlayer2D

func _on_body_entered(body: Fish) -> void:
	if(correct == true):
		print("Sound!")
		asp.play()
		queue_free()
	else:
		print("Trash!")
		body.queue_free()
