class_name UserInterface
extends Control


enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
}

signal navigation_requested(view : Views)


func _on_prototype_generator_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)


func _on_prototype_clicker_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)


func _on_prototype_upgrades_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)
