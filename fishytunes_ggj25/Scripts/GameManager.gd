extends Node2D

var GAME_OVER_SCENE = preload("res://Scenes/GameOverScene.tscn")
var GAME_WON_SCENE = preload("res://Scenes/GameWonScene.tscn")
var WELCOME_SCENE = preload("res://Scenes/WelcomeScene.tscn")

func add_ui_scene(scene_instance):
	if not scene_instance:
		push_error("Failed to instantiate UI scene")
		return
		
	var root = get_tree().get_root()
	if not root:
		push_error("Could not find root")
		return
		
	var main_node = root.get_node_or_null("Node2D")
	if not main_node:
		push_error("Could not find Node2D, creating new scene")
		get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
		return
		
	var ui_layer = main_node.get_node_or_null("UILayer")
	if not ui_layer:
		ui_layer = CanvasLayer.new()
		ui_layer.name = "UILayer"
		ui_layer.layer = 3
		main_node.add_child(ui_layer)
	ui_layer.add_child(scene_instance)

func game_over():
	var scene = GAME_OVER_SCENE.instantiate()
	add_ui_scene(scene)

func reset_game():
	var root = get_tree().get_root()
	if root:
		var main_node = root.get_node_or_null("Node2D")
		if main_node:
			main_node.queue_free()
	await get_tree().create_timer(0.1).timeout  # Small delay to ensure cleanup
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

func game_won():
	var scene = GAME_WON_SCENE.instantiate()
	add_ui_scene(scene)

func welcome():
	var scene = WELCOME_SCENE.instantiate()
	add_ui_scene(scene)
