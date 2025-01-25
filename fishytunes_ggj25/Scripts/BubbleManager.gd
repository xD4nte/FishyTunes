extends Node2D

@export var bubble_scene: PackedScene = preload("res://Assets/Bubbles.tscn")

const BUBBLE_COLORS = {
	"pink": preload("res://Bubble_pink.png"),
	"blue": preload("res://Bubble_blue.png"),
	"green": preload("res://Bubble_green.png"),
	"yellow": preload("res://Bubble_yellow.png")
}

const NOTES = {
	"default": preload("res://C1.mp3"),
	"trash": preload("res://garbage.mp3")
}

signal level_completed

var level_patterns = {
	"level_1": {
		"columns": [
			{
				"bubbles": [
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2},
					{"color": "blue", "note": "default", "correct": true, "scale": 2.0},
					{"color": "green", "note": "default", "correct": false, "scale": 2.3},
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.1},
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2}
				],
				"x_position": 334,
				"spacing": 200
			},
			{
				"bubbles": [
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "green", "note": "default", "correct": false, "scale": 2.3},
					{"color": "pink", "note": "default", "correct": true, "scale": 2.2},
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.1},
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0}
				],
				"x_position": 752,
				"spacing": 200
			}, 
			{
				"bubbles": [
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "green", "note": "default", "correct": false, "scale": 2.3},
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2},
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.1},
					{"color": "blue", "note": "default", "correct": true, "scale": 2.0}
				],
				"x_position": 1086,
				"spacing": 200
			}
		]
	},
	"level_2": {
		"columns": [
			{
				"bubbles": [
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.0},
					{"color": "green", "note": "default", "correct": true, "scale": 2.3},
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2}
				],
				"x_position": 334,
				"spacing": 250
			},
			{
				"bubbles": [
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2},
					{"color": "yellow", "note": "default", "correct": true, "scale": 2.0},
					{"color": "green", "note": "default", "correct": false, "scale": 2.3},
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0}
				],
				"x_position": 652,
				"spacing": 250
			},
			{
				"bubbles": [
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2},
					{"color": "yellow", "note": "default", "correct": true, "scale": 2.0},
					{"color": "green", "note": "default", "correct": false, "scale": 2.3}
				],
				"x_position": 970,
				"spacing": 250
			},
			{
				"bubbles": [
					{"color": "green", "note": "default", "correct": false, "scale": 2.3},
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "default", "correct": true, "scale": 2.2},
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.0}
				],
				"x_position": 1288,
				"spacing": 250
			},
			{
				"bubbles": [
					{"color": "yellow", "note": "default", "correct": false, "scale": 2.0},
					{"color": "green", "note": "default", "correct": true, "scale": 2.3},
					{"color": "blue", "note": "default", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "default", "correct": false, "scale": 2.2}
				],
				"x_position": 1606,
				"spacing": 250
			}
		]
	}
}

var active_bubbles = {}
var time_passed = 0.0
var hover_amplitude = 0.2
var hover_speed = 1.0
var current_level = "level_1"

func _ready():
	load_level(current_level)

func _process(delta):
	time_passed += delta
	hover_bubbles()
	
	if Input.is_action_just_pressed("highlight_bubbles"):
		highlight_correct_bubbles()

func load_level(level_key: String):
	for bubble in active_bubbles.values():
		bubble.queue_free()
	active_bubbles.clear()
	
	var pattern = level_patterns[level_key]
	var bubble_id = 0
	
	for column in pattern["columns"]:
		for i in range(len(column["bubbles"])):
			var bubble_data = column["bubbles"][i]
			var bubble = bubble_scene.instantiate()
			var pos = Vector2(
				column["x_position"],
				119 + (i * column["spacing"])
			)
			bubble.position = pos
			bubble.scale = Vector2(bubble_data["scale"], bubble_data["scale"])
			bubble.correct = bubble_data["correct"]
			bubble.name = "b%d" % bubble_id
			
			set_bubble_color(bubble, bubble_data["color"])
			set_bubble_note(bubble, bubble_data["note"])
			
			# Connect to bubble's completion signal
			bubble.connect("bubble_completed", _on_bubble_completed)
			
			active_bubbles[bubble.name] = bubble
			add_child(bubble)
			bubble_id += 1

func set_bubble_color(bubble: Node2D, color_name: String):
	var sprite = bubble.get_node("Sprite2D")
	sprite.texture = BUBBLE_COLORS[color_name]

func set_bubble_note(bubble: Node2D, note_name: String):
	var note_player = bubble.get_node("Note")
	note_player.stream = NOTES[note_name]

func hover_bubbles():
	for bubble_id in active_bubbles:
		var bubble = active_bubbles[bubble_id]
		var original_pos = bubble.position
		var column_offset = float(bubble.position.x) / 1000.0
		var offset = sin(time_passed * hover_speed + column_offset) * hover_amplitude
		bubble.position.y = original_pos.y + offset

func highlight_correct_bubbles():
	for bubble_id in active_bubbles:
		var bubble = active_bubbles[bubble_id]
		if bubble.correct:
			var tween = create_tween()
			tween.tween_property(bubble, "scale", bubble.scale * 1.2, 0.3)
			tween.tween_property(bubble, "scale", bubble.scale, 0.3)

func _on_bubble_completed(bubble):
	if bubble.correct:
		bubble.note.play()
		bubble.hide()
