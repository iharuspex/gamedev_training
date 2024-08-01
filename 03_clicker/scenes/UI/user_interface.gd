class_name UserInterface
extends Control


enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
}

signal navigation_requested(view : Views)


func _on_prototype_generator_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)


func _on_prototype_clicker_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)
