extends KinematicBody

export var MAXSPEED = 10.0

var velocity = Vector3.ZERO

func _physics_process(_delta):
	var direction = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		direction.z -= 1
	if Input.is_action_pressed("back"):
		direction.z += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
		
	if Input.is_action_pressed("up"):
		direction.y += 1
	if Input.is_action_pressed("down"):
		direction.y -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.x = direction.x * MAXSPEED
	velocity.y = direction.y * MAXSPEED
	velocity.z = direction.z * MAXSPEED
	velocity = move_and_slide(velocity, Vector3.UP)
