extends KinematicBody2D

var velocity = Vector2()
var MOVING_SPEED = 500 # pour les besoin de dev, je le fais aller vite, penser a réduire la vitesse
var on_ground = true

const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

const FIREBALL = preload("res://scenes/fireballs.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# starting the main animation
#	$AnimatedSprite.play("idle_fly")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVING_SPEED
		$AnimatedSprite.play("idle_fly")
		$AnimatedSprite.flip_h = false # flipping to the right
		print("position x going right : ", $Position2D.position.x)
		print("position x sign : ", sign($Position2D.position.x))
		
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MOVING_SPEED
		$AnimatedSprite.play("idle_fly")
		$AnimatedSprite.flip_h = true # flipping to the left
		print("position x going left : ", $Position2D.position.x)
		print("position x sign : ", sign($Position2D.position.x))
		
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
		
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idle_stand")
		
		
	if Input.is_action_pressed("ui_up"):
		velocity.y = JUMP_POWER
		$AnimatedSprite.play("idle_fly")
		
	if Input.is_action_just_pressed("ui_focus_next"):
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)			
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position

	velocity.y += GRAVITY
	
	# check up if we hit a floor or not
	
	if is_on_floor():
		on_ground = true
#		$AnimatedSprite.play("idle_stand")		
	else:
		on_ground = false
#		if velocity.y > 0:
#			$AnimatedSprite.play("idle_stand")

		
	velocity = move_and_slide(velocity, FLOOR)
