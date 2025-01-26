extends Node

func _ready():
	await get_tree().create_timer(0.1).timeout
	var sprite = get_parent() as Sprite2D
	if sprite and sprite.texture:
		var viewport_size = get_viewport().get_visible_rect().size
		var texture_size = sprite.texture.get_size()
		var scale_factor = viewport_size.y / texture_size.y
		sprite.scale = Vector2(scale_factor, scale_factor)
		
		# Center horizontally and vertically
		sprite.position.x = viewport_size.x / 2
		sprite.position.y = viewport_size.y / 2 
