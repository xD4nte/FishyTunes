extends Node

signal game_won

var current_level = "level_1"
var max_level = 2  # Update this when adding more levels
var screen_width = 1920  # Screen width in pixels
var is_transitioning = false
@onready var Melody_Lvl1 = $"../Melody_Lvl1"
@onready var Melody_Lvl2 = $"../Melody_Lvl2"
@onready var Melody_Lvl3 = $"../Melody_Lvl3"

@onready var bubble_manager = $"../BubbleLayer/BubbleManager"
@onready var transition = $"../TransitionEffect"
@onready var player = $"../PlayerLayer/Player"

func _ready():
	bubble_manager.connect("level_completed", _on_level_completed)
	connect("game_won", _on_game_won)
	start_game()

func start_game():
	current_level = "level_1"
	GameManager.welcome()
	load_current_level()

func _process(_delta):
	if not is_transitioning and player.position.x >= screen_width - 100:  # Player reached right side
		_on_level_completed()

func reset_player():
	player.position.x = 15
	player.position.y = 540

func load_current_level():
	is_transitioning = true
	await transition.fade_in()
	reset_player()
	bubble_manager.load_level(current_level)
	await transition.fade_out()
	is_transitioning = false
	bubble_manager.highlight_correct_bubbles()

func _on_level_completed():
	var level_number = int(current_level.split("_")[1])
	if(level_number == 1):
		Melody_Lvl1.play()
	elif(level_number == 2):
		Melody_Lvl2.play()
	is_transitioning = true
	if level_number == max_level:
		emit_signal("game_won")
		_on_game_won()
	else:
		current_level = "level_%d" % (level_number + 1)
		load_current_level()

func _on_game_won():
	if is_instance_valid(bubble_manager):
		bubble_manager.queue_free()
	if is_instance_valid(player):
		player.queue_free()
	GameManager.game_won()
