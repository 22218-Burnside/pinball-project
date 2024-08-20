extends CharacterBody2D
class_name Bat


var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left") and position.x > 50:
		#move left
		velocity.x -= speed * delta
	if Input.is_action_pressed("ui_right") and position.x < 1002:
		velocity.x += speed * delta
	var collision = move_and_collide(velocity)
	

