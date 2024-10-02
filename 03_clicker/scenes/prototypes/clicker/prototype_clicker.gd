class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust.


## Reference to the user interface
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Initialize visibility at launch.
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_requests)


## Create 1 stardust.
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()


## Triggered when the create stardust button is pressed.
func _on_button_pressed() -> void:
	create_stardust()
	

## Watch for navigation requests and react accordingly.
func _on_navigation_requests(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
	else:
		visible = false
