extends Node2D

var AsteroidSmall = load("res://Asteroids_Scene/AsteroidSmall.tscn")
var AsteroidMedium = load("res://Asteroids_Scene/AsteroidMedium.tscn")
var AsteroidLarge = load("res://Asteroids_Scene/AsteroidLarge.tscn")

onready var ship = get_tree().current_scene.find_node("Ship")

export var level = 0
export var safeRadius = 200
export var asteroidsPerLevel = 2
export var maxSpeed = 200
export var minSpeed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() == 0:
		level += 1 
		var avoid = ship.position
		var viewport = get_viewport().get_visible_rect().size
		for i in range(0, level * asteroidsPerLevel):
			var child
			match randi() % 3:
				0: child = AsteroidSmall.instance()
				1: child = AsteroidMedium.instance()
				2: child = AsteroidLarge.instance()
			
			var where = avoid
			while (where - avoid).length() <= safeRadius:
				where.x = rand_range(0, viewport.x)
				where.y = rand_range(0, viewport.y)
				pass
			child.position = where
			
			var angle = randi() * PI * 2
			var speed = rand_range(minSpeed, maxSpeed)
			child.linear_velocity = Vector2(speed, 0).rotated(angle)
			
			add_child(child)
			
	pass
