extends Node2D

@export var bubble_scene: PackedScene = preload("res://Assets/Bubbles.tscn")

const BUBBLE_COLORS = {
	"pink": preload("res://Assets/Bubbles/Bubble_pink.png"),
	"blue": preload("res://Assets/Bubbles/Bubble_blue.png"),
	"green": preload("res://Assets/Bubbles/Bubble_green.png"),
	"yellow": preload("res://Assets/Bubbles/Bubble_yellow.png"),
	"darkblue": preload("res://Assets/Bubbles/Bubble_darkblue.png"),
	"darkgreen": preload("res://Assets/Bubbles/Bubble_darkgreen.png"),
	"darkyellow": preload("res://Assets/Bubbles/Bubble_darkyellow.png"),
	"lightred": preload("res://Assets/Bubbles/Bubble_lightred.png"),
	"orange": preload("res://Assets/Bubbles/Bubble_orange.png"),
	"pearl": preload("res://Assets/Bubbles/Bubble_pearl.png"),
	"purple": preload("res://Assets/Bubbles/Bubble_purple.png"),
	"red": preload("res://Assets/Bubbles/Bubble_red.png"),
	"violet": preload("res://Assets/Bubbles/Bubble_violet.png")
}

const NOTES = {
	"trash": preload("res://Assets/Sounds/garbage.mp3"),
	"C1": preload("res://Assets/Sounds/C1.mp3"),
	"C#1": preload("res://Assets/Sounds/C#1.mp3"),
	"D1": preload("res://Assets/Sounds/D1.mp3"),
	"D#1": preload("res://Assets/Sounds/D#1.mp3"),
	"E1": preload("res://Assets/Sounds/E1.mp3"),
	"F1": preload("res://Assets/Sounds/F1.mp3"),
	"F#1": preload("res://Assets/Sounds/F#1.mp3"),
	"G1": preload("res://Assets/Sounds/G1.mp3"),
	"G#1": preload("res://Assets/Sounds/G#1.mp3"),
	"A1": preload("res://Assets/Sounds/A1.mp3"),
	"A#1": preload("res://Assets/Sounds/A#1.mp3"),
	"H1": preload("res://Assets/Sounds/H1.mp3"),
	"C2": preload("res://Assets/Sounds/C2.mp3")
}

const COLOR_NOTE_MAP = {
	"red": "C1",
	"orange": "C#1",
	"yellow": "D1",
	"green": "D#1",
	"blue": "E1",
	"purple": "F1",
	"violet": "F#1",
	"pink": "G1"
}

signal level_completed

var level_patterns = {
	"level_1": {
		"columns": [
			{
				"bubbles": [
					{"color": "yellow", "note": "A1", "correct": true, "scale": 1.8},
					{"color": "darkgreen", "note": "D1", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "G1", "correct": false, "scale": 2.2},
					{"color": "blue", "note": "F#1", "correct": false, "scale": 1.5},
					{"color": "orange", "note": "D#1", "correct": false, "scale": 2.1},
					{"color": "violet", "note": "C1", "correct": false, "scale": 2.4}
				],
				"x_position": 480,
				"spacing": 160
			},
			{
				"bubbles": [
					{"color": "blue", "note": "A1", "correct": false, "scale": 2.0},
					{"color": "darkyellow", "note": "G#1", "correct": false, "scale": 1.8},
					{"color": "darkblue", "note": "G1", "correct": false, "scale": 2.2},
					{"color": "green", "note": "F#1", "correct": false, "scale": 2.1},
					{"color": "purple", "note": "F1", "correct": false, "scale": 1.5},
					{"color": "lightred", "note": "E1", "correct": true, "scale": 2.0}
				],
				"x_position": 960,
				"spacing": 160
			},
			{
				"bubbles": [
					{"color": "pink", "note": "A1", "correct": false, "scale": 1.5},
					{"color": "blue", "note": "G#1", "correct": false, "scale": 2.2},
					{"color": "darkgreen", "note": "G1", "correct": false, "scale": 2.0},
					{"color": "pearl", "note": "F#1", "correct": true, "scale": 2.1},
					{"color": "red", "note": "F1", "correct": false, "scale": 1.8},
					{"color": "lightred", "note": "E1", "correct": false, "scale": 2.1}
				],
				"x_position": 1440,
				"spacing": 160
			}
		]
	},
	"level_2": {
		"columns": [
			{
				"bubbles": [
					{"color": "darkblue", "note": "F1", "correct": false, "scale": 1.5},
					{"color": "blue", "note": "E1", "correct": true, "scale": 1.8},
					{"color": "darkyellow", "note": "D#1", "correct": false, "scale": 2.2},
					{"color": "pearl", "note": "D1", "correct": false, "scale": 2.1},
					{"color": "orange", "note": "C#1", "correct": false, "scale": 2.0},
					{"color": "lightred", "note": "C1", "correct": false, "scale": 1.7}
				],
				"x_position": 334,
				"spacing": 160
			},
			{
				"bubbles": [
					{"color": "purple", "note": "F1", "correct": false, "scale": 2.0},
					{"color": "pink", "note": "E1", "correct": false, "scale": 2.2},
					{"color": "darkgreen", "note": "D#1", "correct": false, "scale": 1.8},
					{"color": "yellow", "note": "D1", "correct": true, "scale": 2.1},
					{"color": "red", "note": "C#1", "correct": false, "scale": 2.4},
					{"color": "green", "note": "C1", "correct": false, "scale": 2.0}
				],
				"x_position": 752,
				"spacing": 160
			},
			{
				"bubbles": [
					{"color": "darkyellow", "note": "F1", "correct": false, "scale": 1.5},
					{"color": "darkblue", "note": "E1", "correct": false, "scale": 1.8},
					{"color": "violet", "note": "D#1", "correct": false, "scale": 2.0},
					{"color": "blue", "note": "D1", "correct": false, "scale": 2.1},
					{"color": "pink", "note": "C#1", "correct": false, "scale": 2.4},
					{"color": "red", "note": "C1", "correct": true, "scale": 2.1}
				],
				"x_position": 1170,
				"spacing": 160
			},
			{
				"bubbles": [
					{"color": "purple", "note": "F1", "correct": true, "scale": 2.4},
					{"color": "pink", "note": "E1", "correct": false, "scale": 1.8},
					{"color": "pearl", "note": "D#1", "correct": false, "scale": 2.0},
					{"color": "yellow", "note": "D1", "correct": false, "scale": 2.1},
					{"color": "orange", "note": "C#1", "correct": false, "scale": 2.0},
					{"color": "blue", "note": "C1", "correct": false, "scale": 2.1}
				],
				"x_position": 1588,
				"spacing": 160
			}
		]
	},
}

var active_bubbles = {}
var time_passed = 0.0
var hover_amplitude = 0.2
var hover_speed = 1.0
var current_level = "level_1"

var average_offset = 75  # Adjust this value as needed
var offset_variance = 50  # Adjust this value as needed

func _ready():
	load_level(current_level)

func _process(delta):
	time_passed += delta
	hover_bubbles()
	
	if Input.is_action_just_pressed("highlight_bubbles"):
		highlight_correct_bubbles()

func load_level(level_key: String):
	# Force cleanup of any remaining tweens
	var tweens = get_tree().get_nodes_in_group("tweens")
	for tween in tweens:
		if tween.is_valid():
			tween.kill()
	
	# Ensure proper cleanup of bubbles
	for bubble in active_bubbles.values():
		if is_instance_valid(bubble):
			if bubble.is_connected("bubble_completed", _on_bubble_completed):
				bubble.disconnect("bubble_completed", _on_bubble_completed)
			remove_child(bubble)
			bubble.queue_free()
	active_bubbles.clear()
	
	# Reset state
	time_passed = 0.0
	current_level = level_key
	
	var pattern = level_patterns[level_key]
	var bubble_id = 0
	
	for column in pattern["columns"]:
		for i in range(len(column["bubbles"])):
			var bubble_data = column["bubbles"][i]
			var bubble = bubble_scene.instantiate()
			var pos = Vector2(
				column["x_position"] + randf_range(-offset_variance, offset_variance),
				119 + (i * column["spacing"])
			)
			bubble.position = pos
			bubble.scale = Vector2(bubble_data["scale"], bubble_data["scale"])
			bubble.correct = bubble_data["correct"]
			bubble.name = "b%d" % bubble_id
			
			set_bubble_color(bubble, bubble_data["color"])
			set_bubble_note(bubble, bubble_data["note"])
			
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
	var correct_bubbles = []
	for bubble_id in active_bubbles:
		var bubble = active_bubbles[bubble_id]
		if is_instance_valid(bubble) and bubble.correct and bubble.visible:
			correct_bubbles.append(bubble)
	
	# Sort bubbles by x position to play from left to right
	correct_bubbles.sort_custom(func(a, b): return a.position.x < b.position.x)
	
	for i in range(len(correct_bubbles)):
		var bubble = correct_bubbles[i]
		if is_instance_valid(bubble):  # Additional safety check
			var tween = create_tween()
			if tween:  # Check if tween creation succeeded
				tween.tween_callback(func():
					if is_instance_valid(bubble) and bubble.visible:
						bubble.note.play()
						var scale_tween = create_tween()
						if scale_tween:  # Check if scale tween creation succeeded
							scale_tween.tween_property(bubble, "scale", bubble.scale * 1.2, 0.2)
							scale_tween.tween_property(bubble, "scale", bubble.scale, 0.2)
				).set_delay(i * 0.5)

func _on_bubble_completed(bubble):
	if is_instance_valid(bubble):
		if bubble.correct:
			bubble.note.play()
			bubble.hide()
		active_bubbles.erase(bubble.name)
