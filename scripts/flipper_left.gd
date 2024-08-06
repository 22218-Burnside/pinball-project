extends Node2D

# code for controls that allow the player to move the flipper. 
func _physics_process(delta):
	if Input.is_action_pressed("flipper left"):
		if rotation_degrees > 150:
			rotation_degrees += -250 * delta
	else:
		if rotation_degrees > 200:
			rotation_degrees = 200
		elif rotation_degrees < 200:
			rotation_degrees = 200
