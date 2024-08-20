extends RigidBody2D
class_name ball
var last_normal = Vector2.ZERO
var hitting_flipper = false
@onready var sfx_flipper_hit = $sfx_flipper_hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 700:
		get_tree().change_scene_to_file("res://scenes/menu_lose.tscn")

func _integrate_forces(state):
	var num_collision = state.get_contact_count()
	if num_collision > 0 and hitting_flipper == true:
		state.apply_central_impulse(state.get_contact_local_normal(0)* 10)
