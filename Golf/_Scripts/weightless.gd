extends RigidBody2D

onready var sprite = get_node("Sprite")
onready var viewPort = get_viewport().get_visible_rect().size

func _integrate_forces(state):
	var size = sprite.texture.get_size() * sprite.scale
	var trans = state.get_transform()
	if trans.origin.x < -size.x / 2:
		trans.origin.x += viewPort.x + size.x
	elif trans.origin.x > viewPort.x + size.x / 2:
		trans.origin.x -= viewPort.x + size.x
	elif trans.origin.y < -size.y / 2:
		trans.origin.y += viewPort.y + size.y
	elif trans.origin.y > viewPort.y + size.y / 2:
		trans.origin.y -= viewPort.y + size.y
		
	state.set_transform(trans)
	pass