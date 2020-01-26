extends "res://_Scripts/weightless.gd"

export(float) var explode_force = 100

var AsteroidSmall = load("res://Asteroids_Scene/AsteroidSmall.tscn")
var AsteroidMedium = load("res://Asteroids_Scene/AsteroidMedium.tscn")

signal explode

enum Size {
	SMALL, MEDIUM, LARGE
}

export(Size) var size = Size.LARGE
var radius

func _ready():
	connect("explode", self, "_explode")
	radius = get_node("Sprite").texture.get_width() / 2 * get_node("Sprite").scale
	pass # Replace with function body.

func _explode():
	if size != Size.SMALL:
		for i in range(0, 3):
			var offset_dir = PI * 2 / 3 * i
			var asteroid
			match size:
				Size.MEDIUM:
					asteroid = AsteroidSmall.instance()
				Size.LARGE:
					asteroid = AsteroidMedium.instance()
			asteroid.position = position + radius.rotated(offset_dir)
			asteroid.linear_velocity = linear_velocity + Vector2(explode_force, 0).rotated(offset_dir)
			get_parent().add_child(asteroid)
	queue_free()
	sleeping = true
	pass
