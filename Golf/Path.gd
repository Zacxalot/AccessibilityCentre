extends Line2D


var Ball

# Called when the node enters the scene tree for the first time.
func _ready():
	Ball = get_parent().get_node("Ball");

func _process(delta):
	if(Ball.runnin):
		points[0] = Ball.position;#
		points[1] = get_viewport().get_mouse_position();
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
