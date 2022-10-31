extends RigidBody

<<<<<<< Updated upstream
#signal collision
signal win
signal lose
var w = "win"
var l = "lose"

var delay = 0

=======
signal win
signal lose


var delay = 0
export var lights = false
var w = "win"
var l = "lose"
>>>>>>> Stashed changes

func _ready():
	randomize()


func _physics_process(_delta):
	#$MeshInstance.get_surface_material(0).albedo_color = Color(randf(),randf(),randf())
	delay+=1
	if delay == 10:
		$DirectionalLight.light_color = Color(randf(), randf(), randf())
		$DirectionalLight2.light_color = Color(randf(), randf(), randf())
		$DirectionalLight7.light_color = Color(randf(), randf(), randf())
		$DirectionalLight8.light_color = Color(randf(), randf(), randf())
		
<<<<<<< Updated upstream
	if delay == 20:
		$DirectionalLight5.light_color = Color(randf(), randf(), randf())
		$DirectionalLight6.light_color = Color(randf(), randf(), randf())
		$DirectionalLight3.light_color = Color(randf(), randf(), randf())
		$DirectionalLight4.light_color = Color(randf(), randf(), randf())
		delay = 0


func _on_BallHitbox_area_entered(area):
	if(area.get_parent()._get_isGoal()):
		emit_signal("win")
		print(w)
		#area.get_parent()._change_color(Color.green)
	else:
		emit_signal("lose")
		print(l)
		#area.get_parent()._change_color(Color.red)
=======
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


#func _on_BallHitbox_area_entered(area):
	#if(area.get_parent()._get_isGoal()):
		#emit_signal("win")
		#print(w)
	#else:
		#emit_signal("lose")
		#print(l)
		


#func _on_drop():
	#queue_free()


func _on_BallHitbox_area_entered(area):
	if(typeof(area.get_parent()) == typeof(MeshInstance)):
		print(typeof(area.get_parent()))
		print(typeof(MeshInstance))
		if(area.get_parent()._get_isGoal()):
			emit_signal("win")
			print(w)
		else:
			emit_signal("lose")
			print(l)
	else:
		pass
>>>>>>> Stashed changes
