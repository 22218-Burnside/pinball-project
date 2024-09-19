extends Camera2D

@export var RandomStrength: float = 30.0
@export var ShakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var Shake_Strength: float = 0.0 
var Can_Shake = false

func apply_shake():
	Shake_Strength = randf_range(15,45)

func _process(delta):
	if Can_Shake == true:
		apply_shake()
		Can_Shake = false
	if Shake_Strength > 0: 
		Shake_Strength = lerpf(Shake_Strength,0,ShakeFade * delta)
		offset = randomOffset()
		

func _on_ball_camera_shake():
	Can_Shake = true

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-Shake_Strength,Shake_Strength),rng.randf_range(-Shake_Strength,Shake_Strength))
