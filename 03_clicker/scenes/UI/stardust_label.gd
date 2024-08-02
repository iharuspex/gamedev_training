class_name LabelStardust
extends Label
## Displays the current amount of stardust available.

func _ready():
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

## Updates the text that reflect the current amount of stardust.
func update_text(_quantity : int = -1) -> void:
	text = "Stardust: %s" %HandlerStardust.ref.stardust()
