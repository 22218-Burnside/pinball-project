extends Node2D
var score = 0

func _process(delta):
	$score_label.text = str(GlobalSingleton.score)
	
func add_score(points):
	GlobalSingleton.add_score(points)
