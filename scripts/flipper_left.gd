extends Node2D
class_name flipper
# code for controls that allow the player to move the flipper. 
func _physics_process(delta):
	if Input.is_action_pressed("flipper left"):
		if rotation_degrees > 170:
			rotation_degrees += -600 * delta
	else:
		if rotation_degrees > 200:
			rotation_degrees = -250 * delta
		elif rotation_degrees < 200:
			rotation_degrees = 200
