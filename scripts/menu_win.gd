extends Control
@onready var label = $Label
@onready var game_win = $game_win
var points_game_final: Label


func _ready():
	label.text = ("Final score: ") + str(GlobalSingleton.score)
	game_win.play()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
