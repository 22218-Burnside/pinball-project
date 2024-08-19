extends Control
@onready var sfx_menu_click = $"sfx menu click"

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)
	sfx_menu_click.play()

func _on_volume_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)
