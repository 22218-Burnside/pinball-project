extends Control
@onready var label = $Label
@onready var sfx_game_lose = $sfx_game_lose
var points_game_final: Label


func _ready():
	label.text = ("Final score: ") + str(GlobalSingleton.score)
	sfx_game_lose.play()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
