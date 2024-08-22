extends Node2D
var score = 0

func _ready():
	GlobalSingleton.score = 0 


func _process(delta):
	$score_label.text = ("Score: ") + str(GlobalSingleton.score)


func _on_ball_add_score():
	GlobalSingleton.add_score(10)
