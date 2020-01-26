 extends RigidBody2D

var BallPath;
var stationary = true;
var whacks = 0;
var runnin = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	stationary = true;
	print(stationary);
	BallPath = get_parent().get_node("Path");
	

func _process(delta):
	#linear_velocity = linear_velocity - linear_velocity.normalized() * 4

	if linear_velocity.length() < 8:
		linear_velocity = Vector2(0,0);
		show_path();

func hit(direction):
	if(stationary && runnin):
		whacks += 1;
		hide_path();
		
		if(direction.length() > 600):
			direction = direction.normalized() * 1000;
		
		apply_impulse(Vector2(0,0),direction);

func _input(event):
	if(Input.is_action_just_pressed("ui_accept")):
		hit(get_viewport().get_mouse_position() - position);
		
func show_path():
	if runnin:
		stationary = true;
		BallPath.visible = true;
	
func hide_path():
	stationary = false;
	BallPath.visible = false;

func _on_Area2D_body_entered(body):
	print("Potted");
	for nod in get_parent().get_children():
		nod.visible = false;
	get_parent().get_node("Label").text += str(whacks);
	get_parent().get_node("Label").visible = true;
	runnin = false; 
	 
