extends Node2D
var flipping = false
const SPEED = 50

#allows the player to move left and right
func _process(delta):
	if position.x > 10 and Input.is_action_pressed("flipper_left"):
		#we can move left
		position.x -= SPEED 
	if position.x < 720 and Input.is_action_pressed("flipper_right"):
		#we can move left
		position.x += SPEED 
