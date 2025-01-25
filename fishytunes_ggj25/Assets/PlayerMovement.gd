extends Fish

signal player_died
@export var player_body : CharacterBody2D

var edge_of_screen := Vector2(1920,1080)

# Called when the node enters the scene tree for the first time.
func _ready():
	start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = input * move_speed
	player_body.move_and_slide()
	
	position.x = clampf(position.x, 0, edge_of_screen.x)
	position.y = clampf(position.y, 0, edge_of_screen.y)

func die():
	player_died.emit()
	set_process(false)
	hide()
	GameManager.game_over()
	
func start():
	show()
	set_process(true)
