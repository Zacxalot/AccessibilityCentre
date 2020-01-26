extends Control

var timer = 0;
var inButton = false;
var buttonIn = "";
var loadBar;
var audio
# Called when the node enters the scene tree for the first time.
func _ready():
	loadBar = get_node("Line2D");
	audio = get_node("AudioStreamPlayer")
func _process(delta):
	if(inButton):
		timer += delta;
		loadBar.width = timer * 20;
		audio.volume_db = -30 + timer * 10;
		if(timer > 3):
			if(buttonIn == "golf"):
				get_tree().change_scene("res://Golf.tscn");
			elif(buttonIn == "asteroids"):
				get_tree().change_scene("res://Asteroids.tscn");
			elif(buttonIn == "jump"):
				get_tree().change_scene("res://world.tscn");
			elif(buttonIn == "2048"):
				get_tree().change_scene("res://scenes/main.tscn");

func _on_Button_mouse_entered():
	buttonIn = "golf";
	inButton = true
	
func _on_Button_mouse_exited():
	inButton = false;
	timer = 0;
	loadBar.width = 0;
	audio.volume_db = -30;
	
func _on_Button_pressed():
	get_tree().change_scene("res://Golf.tscn");
	
func _on_Button2_pressed():
	get_tree().change_scene("res://Asteroids.tscn");

func _on_Button3_pressed():
	get_tree().change_scene("res://world.tscn");
	
func _on_Button2_mouse_entered():
	buttonIn = "asteroids";
	inButton = true;

func _on_Button2_mouse_exited():
	inButton = false;
	timer = 0;
	audio.volume_db = 0;
	loadBar.width = -30;
	
func _on_Button3_mouse_entered():
	buttonIn = "jump";
	inButton = true;

func _on_Button3_mouse_exited():
	inButton = false;
	timer = 0;
	loadBar.width = 0;
	audio.volume_db  = -30;


func _on_Button4_pressed():
	get_tree().change_scene("res://scenes/main.tscn");


func _on_Button4_mouse_entered():
	buttonIn = "2048";
	inButton = true;


func _on_Button4_mouse_exited():
	inButton = false;
	timer = 0;
	loadBar.width = 0;
	audio.volume_db  = -30;
