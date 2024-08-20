extends Control
@onready var sfx_menu_click = $"sfx menu click"
var scenetoload = ""


func _ready():
	$"VBoxContainer/start button".grab_focus()

func _on_start_button_pressed():
	sfx_menu_click.play()
	$Timer.start()
	scenetoload = "res://scenes/level.tscn"


func _on_timer_timeout():
	get_tree().change_scene_to_file(scenetoload)
