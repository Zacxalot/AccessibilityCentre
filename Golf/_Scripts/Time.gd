extends Label

signal timeout
signal endIt

var TIME_PERIOD = 60 # 500ms

var time = 0
var display_time

func _ready():
	connect("timeout", self, "_timeout")
	connect("endIt", self, "_timeout")
	pass # Replace with function body.

var flag = true
var timeFlag = true

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
	elif !timeFlag:
		if time > TIME_PERIOD:
			emit_signal("endIt")

			# Reset timer
		else:
			time += delta
			display_time = TIME_PERIOD - time
			text = "Time: " + String(display_time)
	pass


func _timeout():
	if timeFlag:
		set_scale(Vector2(3, 3))
		time = 0
		TIME_PERIOD = 2
		timeFlag = false
	else:
		get_tree().reload_current_scene()
	pass