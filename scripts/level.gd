extends Node2D
var score = 0

signal camera_limit

func _ready():
	GlobalSingleton.score = 0 


func _process(delta):
	$score_label.text = ("Score: ") + str(GlobalSingleton.score)
	$score_label2.text = ("Score: ") + str(GlobalSingleton.score)
	$score_label3.text = ("Score: ") + str(GlobalSingleton.score)
	
func _on_ball_add_score(score):
	GlobalSingleton.add_score(score)

#region Camera changing area scripts
# These scripts make the ball go up
func _on_area_change_up_body_entered(body: Node2D) -> void:
	if body is Ball:
		$ball/ball_camera.limit_top = -672
		$ball/ball_camera.limit_bottom = -72
		$ball.position = Vector2(400, -265)


func _on_area_to_change_up_body_entered(body: Node2D) -> void:
	if body is Ball:
		$ball/ball_camera.limit_top = -1344
		$ball/ball_camera.limit_bottom = -744
		$ball.position = Vector2(400, -890)

#these scripts make the ball go down
func _on_area_change_down_2_body_entered(body: Node2D) -> void:
	if body is Ball:
		$ball/ball_camera.limit_top = 0
		$ball/ball_camera.limit_bottom = 600
		$ball.position = Vector2(400, 300)


func _on_area_change_down_body_entered(body: Node2D) -> void:
	if body is Ball:
		$ball/ball_camera.limit_top = -672
		$ball/ball_camera.limit_bottom = -72
		$ball.position = Vector2(400, -265)
#endregion
