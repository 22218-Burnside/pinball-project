extends Control
@onready var sfx_menu_click = $"sfx menu click"
var scenetoload = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/start button".grab_focus()

func _on_start_button_pressed():
	sfx_menu_click.play()
	$Timer.start()
	scenetoload = "res://scenes/level 1.tscn"

func _on_options_button_pressed():
	sfx_menu_click.play()
	$Timer.start() 
	scenetoload = "res://scenes/menu_options.tscn"

func _on_credits_button_pressed():
	sfx_menu_click.play()
	$Timer.start() 
	scenetoload = "res://scenes/menu_credits.tscn"

func _on_timer_timeout():
	get_tree().change_scene_to_file(scenetoload)
