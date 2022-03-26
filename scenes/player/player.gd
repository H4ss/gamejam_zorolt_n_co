extends KinematicBody2D

var velocity = Vector2()
var MOVING_SPEED = 250

const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# starting the main animation
	$AnimatedSprite.play("idle_fly")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVING_SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MOVING_SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_up"):
		velocity.y = JUMP_POWER

#	else:
#		velocity.y = 0

	velocity.y += GRAVITY

		
	velocity = move_and_slide(velocity, FLOOR)
