extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
var speed =150
const JUMP_HEIGHT=-450
const ACCELERATE = 50

var motion = Vector2()
var flag = false
func _physics_process(delta):
	if !flag:
		motion.x=1
		flag = true
	motion.y +=GRAVITY
	if Input.is_action_pressed("ui_right"):
		if speed<300:
			speed+=ACCELERATE
			if speed>=200:
				$Sprite.play("sprint")
	elif Input.is_action_pressed("ui_left"):
		if speed>100:
			speed-=ACCELERATE
			if speed<200:
				$Sprite.play("run")
	elif motion.x<=0:
		flag=false
		position=Vector2(464,96)
	else:
		$Sprite.play("run")
		motion.x = speed
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=JUMP_HEIGHT
	else: 
		$Sprite.play("jump")
	
	
	
	motion = move_and_slide(motion, UP)
	pass