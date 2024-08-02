class_name PrototypeUpgrades
extends Control
## Prototype of a view displaying upgrades.


## Reference to the user interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Initialize visibility at launch.
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_requests)


## Watch for navigation requests and react accordingly.
func _on_navigation_requests(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
	else:
		visible = false
