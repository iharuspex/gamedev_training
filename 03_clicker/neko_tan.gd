extends Node2D

@export var Sprite: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed() :
				$Sprite.scale = Vector2(0.69, 0.69)
			else:
				$Sprite.scale = Vector2(0.7, 0.7)
				if $Sprite.get_rect().has_point(to_local(event.position)):
					print("Click detected!")
