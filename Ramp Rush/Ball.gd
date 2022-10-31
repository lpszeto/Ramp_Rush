extends RigidBody

#signal collision
signal win
signal lose
var w = "win"
var l = "lose"

var delay = 0


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
