tool
extends Label

export var score = 0 setget set_score
signal timeout

const TIME_PERIOD = 60 # 500ms

var time = 0
var display_time
var flag = true
# Called when the node enters the scene tree for the first time.
func _ready():
	set_score(score)
	connect("timeout", self, "_timeout")
	pass # Replace with function body.

func set_score(newScore):
	text = "Score: " + String(newScore)
	score = newScore
	pass
	
func _process(delta):
	if flag:
		if time > TIME_PERIOD:
			emit_signal("timeout")
			flag = false
			# Reset timer
		else:
			time += delta

func _timeout():

	set_scale(Vector2(3, 3))
	pass
	
