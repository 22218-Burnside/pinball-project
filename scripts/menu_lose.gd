extends Control
@onready var label = $Label
@onready var sfx_game_lose = $sfx_game_lose
var points_game_final: Label


func _ready():
	label.text = ("Final score: ") + str(GlobalSingleton.score)
	sfx_game_lose.play()


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
