extends CharacterBody2D
class_name Ball

var speed := 150
signal add_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#give it a random velocity
	velocity = get_random_velocity() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		#bounce!
		velocity = velocity.bounce(collision.get_normal())
		#TODO- check the thing we bounce against?
		var other = collision.get_collider()
		print(other.name)
		if other is Bat:
			#add 20 to speed of ball
			velocity += velocity.normalized() * 20
		if other is Block:
			#TODO send ginal to update score?
			add_score.emit()
			other.queue_free()
	if position.y >= 700:
		get_tree().change_scene_to_file("res://scenes/menu_lose.tscn")

func get_random_velocity() -> Vector2:
	var v = Vector2(-randf_range(-1,1),1).normalized()
	return v	
	
