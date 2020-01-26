extends "res://_Scripts/weightless.gd"

var Missile = preload("res://Asteroids_Scene/Missile.tscn")

onready var ui = get_tree().current_scene.get_node("UI")

export(float) var engine_thrust = 200
export(float) var spin_thrust = 2000
export(float) var missile_speed = 300
export(float) var recharge_time = .3

var thrust = Vector2()
var rotation_dir = 0
var recharge_timer = 0
var Mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	 
	if recharge_timer <= 0:
		var missile = Missile.instance()
		missile.position = position
		missile.rotation = rotation
		missile.linear_velocity = linear_velocity + Vector2(missile_speed, 0).rotated(rotation)
		get_parent().add_child(missile)
		recharge_timer = recharge_time
	else:
		recharge_timer -= delta
	pass 