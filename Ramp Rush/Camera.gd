extends KinematicBody

export var MAXSPEED = 10.0
export var SENSITIVITY = 0.2

signal selecting

export var maxActiveBlocks = 3
var numActive = 0 
var velocity = Vector3.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

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
		direction = direction.normalized().rotated(Vector3.UP, rotation.y)
	
	velocity.x = direction.x * MAXSPEED
	velocity.y = direction.y * MAXSPEED
	velocity.z = direction.z * MAXSPEED
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if Input.is_action_just_pressed("select"):
		if numActive >= maxActiveBlocks:
			emit_signal("selecting")
	
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _input(event):
	if event is InputEventMouseMotion:
		var movement = event.relative
		rotation.x -= deg2rad(movement.y * SENSITIVITY)
		rotation.y -= deg2rad(movement.x * SENSITIVITY)
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))
		
func _added_Block():
	numActive += 1
	
func _deleted_Block():
	numActive -= 1
