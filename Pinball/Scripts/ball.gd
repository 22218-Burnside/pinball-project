extends CharacterBody2D
class_name Ball
@onready var paddle_hit = $paddle_hit
@onready var block_hit = $block_hit
@onready var wall_hit = $wall_hit

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
		velocity = velocity.rotated(randf_range(-0.1,0.1))
		#TODO- check the thing we bounce against?
		var other = collision.get_collider()
		print(other.name)
		if other is Bat:
			#add 20 to speed of ball
			velocity += velocity.normalized() * 20
			paddle_hit.play()
		if other is Block:
			#TODO send ginal to update score?
			add_score.emit()
			other.queue_free()
			block_hit.play()
		else:
			pass
			wall_hit.play()
	if position.y >= 700:
		get_tree().change_scene_to_file("res://scenes/menu_lose.tscn")
	if position.y <= -30:
		get_tree().change_scene_to_file("res://scenes/menu_win.tscn")

func get_random_velocity() -> Vector2:
	var v = Vector2(-randf_range(-1,1),1).normalized()
	return v	
	
