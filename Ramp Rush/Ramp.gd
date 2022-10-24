extends StaticBody

export var inUse = false

var newMaterial = SpatialMaterial.new()
var oldMaterial = SpatialMaterial.new()

func _ready():
	#sets the colors
	newMaterial.albedo_color = Color(1, 1, 1, 0.2)
	oldMaterial.albedo_color = Color(1, 1, 1, 1)
	
	newMaterial.flags_transparent = true
	
	#this sets the default condition
	$CollisionShape.disabled = true
	$MeshInstance.set_surface_material(0, newMaterial)

#change the layer to none and the color fo a lower alpha value when not used
#
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		toggleUse()

func toggleUse():
	#changes it from ramp placed to not placed
		if inUse:
			$CollisionShape.disabled = true
			$MeshInstance.set_surface_material(0, newMaterial)
			
		else:
			$CollisionShape.disabled = false
			$MeshInstance.set_surface_material(0, oldMaterial)
		inUse = !inUse
