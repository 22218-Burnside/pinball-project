extends Node2D
var score = 0

func add_score(add:int):
	score+=add
	$game_ui/score_Label.text=str(score)
