extends CharacterBody2D
class_name Ball
@onready var paddle_hit = $paddle_hit
@onready var block_hit = $block_hit
@onready var wall_hit = $wall_hit
@onready var explosion_prefab = preload("res://Prefabs/explosion.tscn")

var speed := 150
signal add_score
signal camera_shake
signal pitch_change

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#give it a random velocity
	velocity = get_random_velocity() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		#emits signal to the camera for shake
		camera_shake.emit()
		#bounce!
		velocity = velocity.bounce(collision.get_normal())
		#velocity = velocity.rotated(randf_range(-0.1,0.1))
		#TODO- check the thing we bounce against?
		var other = collision.get_collider()
		print(other.name)
		if other is Bat:
			#add 20 to speed of ball
			velocity += velocity.normalized() * 25
			#velocity = velocity.clampf(0,500)
			paddle_hit.play()
			#add a little bias to the ball bounce
			var offset = other.global_position.x - global_position.x
			print(offset)
			if offset > 0:
				velocity = velocity.rotated(deg_to_rad(-10))
			else:
				velocity = velocity.rotated(deg_to_rad(10))
		if other is Block:
			#TODO send ginal to update score?
			add_score.emit(10)
			var EXPLOSION = explosion_prefab.instantiate()
			EXPLOSION.position = position
			get_parent().add_child(EXPLOSION)
			other.queue_free()
			block_hit.play()
		if other is Diamond:
			add_score.emit(30)
			var EXPLOSION = explosion_prefab.instantiate()
			EXPLOSION.position = position
			get_parent().add_child(EXPLOSION)
			other.queue_free()
			block_hit.play()
		if other is Pentagon:
			add_score.emit(50)
			var EXPLOSION = explosion_prefab.instantiate()
			EXPLOSION.position = position
			get_parent().add_child(EXPLOSION)
			other.queue_free()
			block_hit.play()
		else:
			pass
			wall_hit.play()
			var EXPLOSION = explosion_prefab.instantiate()
			EXPLOSION.position = position
	if position.y >= 700:
		get_tree().change_scene_to_file("res://scenes/menu_lose.tscn")
	if position.y <= -1346:
		get_tree().change_scene_to_file("res://scenes/menu_win.tscn")

func get_random_velocity() -> Vector2:
	var v = Vector2(-randf_range(-1,1),1).normalized()
	return v	
	
