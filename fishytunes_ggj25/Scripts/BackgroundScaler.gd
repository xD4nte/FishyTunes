extends Node

func _ready():
    var viewport_size = get_viewport().get_visible_rect().size
    var sprite = get_parent() as Sprite2D
    var texture_size = sprite.texture.get_size()
    
    # Calculate scale to match viewport height
    var scale_factor = viewport_size.y / texture_size.y
    sprite.scale = Vector2(scale_factor, scale_factor)
    
    # Center horizontally
    sprite.position.x = viewport_size.x / 2
    sprite.position.y = viewport_size.y / 2 