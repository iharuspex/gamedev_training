class_name PrototypeGenerator
extends Control
## Generator prototype creating stardust every seconds.


## Reference to the label displaying the current amount of stardust in storage.
@export var label : Label
## Reference to the button starting the generation.
@export var button : Button
## Reference to the timer.
@export var timer : Timer

## Current amount of stardust in storage.
var stardust : int = 0


## Initialize the label.
func _ready() -> void:
	updatae_label_text()


## Creates stardust and store it.
func create_stardust() -> void:
	stardust += 1
	updatae_label_text()
	
	
## Updates the label text to match the current amount of stardust in storage.
func updatae_label_text() -> void:
	label.text = "Stardust: %s" %stardust


## Start the timer and disable the button.
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true


## Triggered when the "begin generating" button is pressed.
func _on_button_pressed():
	begin_generating_stardust()


## Triggered when the timer times out.
func _on_timer_timeout():
	create_stardust()
