extends RigidBody

var delay = 0
export var lights = false

func _ready():
	set_collision_layer_bit(1,1)
	set_collision_mask_bit(1,1)
	randomize()


func _physics_process(_delta):
	if lights:
	#$MeshInstance.get_surface_material(0).albedo_color = Color(randf(),randf(),randf())
		delay+=1
		if delay == 10:
			$DirectionalLight.light_energy = 0
			$DirectionalLight2.light_color = Color(randf(), randf(), randf())
			$DirectionalLight8.light_energy = 0
			
		if delay == 20:
			$DirectionalLight.light_color = Color(randf(), randf(), randf())
			$DirectionalLight2.light_energy = 0
			$DirectionalLight8.light_color = Color(randf(), randf(), randf())
			
		if delay == 30:
			$DirectionalLight.light_energy = 1
			$DirectionalLight6.light_energy = 1
			$DirectionalLight3.light_energy = 1
			$DirectionalLight5.light_energy = 1
		
		if delay == 40:
			$DirectionalLight5.light_color = Color(randf(), randf(), randf())
			$DirectionalLight6.light_energy = 1
			$DirectionalLight3.light_energy = 1
			$DirectionalLight4.light_color = Color(randf(), randf(), randf())
			
		if delay == 50:
			$DirectionalLight5.light_energy = 0
			$DirectionalLight6.light_color = Color(randf(), randf(), randf())
			$DirectionalLight3.light_color = Color(randf(), randf(), randf())
			$DirectionalLight4.light_energy = 0
			
		if delay == 60:
			$DirectionalLight8.light_energy = 1
			$DirectionalLight6.light_energy = 0
			$DirectionalLight3.light_energy = 0
			$DirectionalLight2.light_energy = 1
			$DirectionalLight5.light_energy = 1
			$DirectionalLight4.light_energy = 1
			delay = 0


func _on_drop():
	queue_free()
