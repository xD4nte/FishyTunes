extends Node

const GAME_OVER_SCENE = preload("res://Scenes/GameOverScene.tscn")
const GAME_WON_SCENE = preload("res://Scenes/GameWonScene.tscn")

func game_over():
	var scene = GAME_OVER_SCENE.instantiate()
	add_child(scene)

func reset_game():
	get_tree().reload_current_scene()

func game_won():
	var scene = GAME_WON_SCENE.instantiate()
	add_child(scene)
