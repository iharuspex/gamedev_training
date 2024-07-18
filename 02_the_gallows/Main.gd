extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D

var player_status = 0

var secret_words = [
	"ПРИВЕТ",
	"ВОЛОКНО",
	"ОБОЛОНЬ",
	"ЛАСТОЧКА",
	"КРАПИВА",
	"УДУШЬЕ"
]

var secret_word = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	secret_word = secret_words[randi() % secret_words.size()]
	print(secret_word)
	var char_num = secret_word.length()
	$GameWord.text = ""
	for i in range(char_num):
		$GameWord.text += "_"; 
	animated_sprite_2d.set_frame_and_progress(player_status, 0.0)

func _input(event):
	if event is InputEventKey and event.is_pressed():
		var letter : String = event.as_text_key_label()
		print(letter)
		
		if letter.unicode_at(0) in range(1040, 1072):
			if secret_word.contains(letter):
				var index = 0
				
				for i in range(0, secret_word.length()):
					if secret_word[i] == letter:
						$GameWord.text[i] = letter
					
			else:
				if $Mistakes.text != "":
					$Mistakes.text += ", "
				$Mistakes.text += letter
				player_status += 1
				animated_sprite_2d.set_frame_and_progress(player_status, 0.0)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
