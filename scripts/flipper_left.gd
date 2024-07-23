extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# code for controls that allow the player to move the flipper. test

func _physics_process(delta):
	if Input.is_action_pressed("flipper left"):
		if(rotation_degrees<180):
			rotation_degrees-=250*delta
	else:
	#	if(rotation_degrees>180):
	#		rotation_degrees=-600*delta
		if(rotation_degrees>180):
			rotation_degrees=180

