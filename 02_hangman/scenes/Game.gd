extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D

var player_status = 0
const GAMEOVER_SCORE = 6

var secret_words = [
	#"ПРИВЕТ",
	#"ВОЛОКНО",
	#"ОБОЛОНЬ",
	#"ЛАСТОЧКА",
	#"КРАПИВА",
	#"УДУШЬЕ",
	#"ВИСЕЛИЦА"
]

var secret_word = ""

func load_words():
	var file = FileAccess.open("res://data/words_ru.csv", FileAccess.READ)
	secret_words = file.get_csv_line()

func _ready():
	load_words()
	
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
				for i in range(0, secret_word.length()):
					if secret_word[i] == letter:
						$GameWord.text[i] = letter
						
				if $GameWord.text == secret_word:
					print("You win!")
					# Display win screen, new game button
					
			else:
				if $Mistakes.text != "":
					$Mistakes.text += ", "
				$Mistakes.text += letter
				player_status += 1
				animated_sprite_2d.set_frame_and_progress(player_status, 0.0)
				
				if player_status == GAMEOVER_SCORE:
					print("Game over")
					# Display game over screen, new game button
			

func _process(_delta):
	pass
