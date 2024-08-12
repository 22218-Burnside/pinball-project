extends Node2D
var flipping = false

# code for controls that allow the player to move the flipper.
func _physics_process(delta):
	if Input.is_action_pressed("flipper right"):
		flipping = true
		if(rotation_degrees<10):
			rotation_degrees+=600*delta
	else:
		flipping = false
		if(rotation_degrees>-20):
			rotation_degrees=-600*delta
		elif(rotation_degrees<-20):
			rotation_degrees=-20
