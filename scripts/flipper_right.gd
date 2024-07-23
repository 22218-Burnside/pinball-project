extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# code for controls that allow the player to move the flipper.

func _physics_process(delta):
	if Input.is_action_pressed("flipper right"):
		if(rotation_degrees<30):
			rotation_degrees+=250*delta
	else:
		if(rotation_degrees>-20):
			rotation_degrees=-600*delta
		elif(rotation_degrees<-20):
			rotation_degrees=-20
