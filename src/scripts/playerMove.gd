extends CharacterBody2D


const MAX_SPEED = 60000.0
const ACCEL = 2000.0

const MAX_SPEED_TURBO = 120000.0
const ACCEL_TURBO = 5000.0

var speed = 0
var vel = 0
var side = 1
var turbo = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y = 0
	
	var _accel = 0
	var _max_speed = 0
	
	if turbo:
		_accel = ACCEL_TURBO
		_max_speed = MAX_SPEED_TURBO
	else:
		_accel = ACCEL
		_max_speed = MAX_SPEED

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		
		if side == direction:
			speed += ACCEL
		else:
			speed -= ACCEL
			
		if speed < 0:
			speed *= -1
			if side > 0:
				side = -1
			else:
				side = 1
	else:
		speed *= 0.85
		
	if speed > MAX_SPEED:
		speed = MAX_SPEED
		
	if speed < -MAX_SPEED:
		speed = -MAX_SPEED
		
	velocity.x = speed * side * delta

	move_and_slide()
