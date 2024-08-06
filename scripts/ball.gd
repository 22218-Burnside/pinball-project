extends RigidBody2D
class_name ball
var last_normal = Vector2.ZERO
var LIVES = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 700:
		LIVES -= 1
		if LIVES == 0:
			get_tree().change_scene_to_file("res://scenes/menu_lose.tscn")

func _on_body_entered(body):
	print(body.name)
	if body.name == "flipper":
		#apply_central_impulse(last_normal*100)
		pass

