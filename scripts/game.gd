extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_score(add:int):
	score+=add
	$game_ui/score_Label.text=str(score)
