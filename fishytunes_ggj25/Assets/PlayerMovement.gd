extends Fish
@export var player_body : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = input * move_speed
	player_body.move_and_slide()
