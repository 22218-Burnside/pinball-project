extends Area2D
var score = 0

func _on_body_entered(body):
	if body.name == "ball":
		get_parent().add_score(100)
