extends Line2D

var vPort; 

# Called when the node enters the scene tree for the first time.
func _ready():
	vPort = get_viewport();

func _process(delta):
	position = vPort.get_mouse_position()

