extends Node

signal game_won

var current_level = "level_1"
var max_level = 2  # Update this when adding more levels
var screen_width = 1920  # Screen width in pixels
var is_transitioning = false

@onready var bubble_manager = $"../BubbleLayer/BubbleManager"
@onready var transition = $"../TransitionEffect"
@onready var player = $"../PlayerLayer/Player"

func _ready():
	bubble_manager.connect("level_completed", _on_level_completed)
	connect("game_won", _on_game_won)
	start_game()

func start_game():
	current_level = "level_1"
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

func _on_level_completed():
	is_transitioning = true
	var level_number = int(current_level.split("_")[1])
	if level_number >= max_level:
		emit_signal("game_won")
		_on_game_won()
	else:
		current_level = "level_%d" % (level_number + 1)
		load_current_level()

func _on_game_won():
	get_tree().change_scene_to_file("res://Scenes/GameWonScene.tscn") 
