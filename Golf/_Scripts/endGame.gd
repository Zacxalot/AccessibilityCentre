extends Label

onready var Time = get_node("Time")
onready var Score = get_node("Score")

signal timeout

const TIME_PERIOD = 5 # 500ms

var time = 0
var display_time

func _ready():
	connect("timeout", self, "_timeout")
	pass # Replace with function body.

var flag = true

func _process(delta):
	if flag:
		if time > TIME_PERIOD:
			emit_signal("timeout")
			flag = false
			# Reset timer
		else:
			time += delta
			display_time = TIME_PERIOD - time
			text = "Time: " + String(display_time)

func _timeout():
	set_scale(Vector2(3, 3))
	pass
