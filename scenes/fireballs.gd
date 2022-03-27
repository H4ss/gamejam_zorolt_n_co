extends Area2D


const SPEED = 400
var velocity = Vector2()
var direction = 1 

func _ready():
	pass # Replace with function body.

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shooting")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	print("fireball hit ", body.name)
	if 'enemy' in body.name:
		body.dead()
	queue_free() # Replace with function body.
