extends Control
@onready var label = $Label
@onready var sfx_game_lose = $sfx_game_lose
var points_game_final: Label


func _ready():
	# game crashes when scene to swapped, due to this code. Possibility of it breaking
	# is because the globalsingleton to track the score is not set up yet.
	label.text = str(GlobalSingleton.score)
	sfx_game_lose.play()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
