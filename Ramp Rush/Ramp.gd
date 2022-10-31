extends StaticBody

signal addedBlock
signal deletedBlock

export var inUse = false
export var selected = false

var newMaterial = SpatialMaterial.new()
var oldMaterial = SpatialMaterial.new()

func _ready():
	#sets the colors
	newMaterial.albedo_color = Color(1, 1, 1, 0.2)
	oldMaterial.albedo_color = Color(1, 1, 1, 1)
	
	newMaterial.flags_transparent = true
	
	$Area.connect("area_entered", $".", "_on_Area_entered")
	$Area.connect("area_exited", $".", "_on_Area_exited")
	
	#this sets the default condition
	$CollisionShape.disabled = true
	$MeshInstance.set_surface_material(0, newMaterial)

#change the layer to none and the color fo a lower alpha value when not used
#
#func _unhandled_input(event):
#	if event.is_action_pressed("ui_accept"):
#		toggleUse()

func toggleUse():
	#changes it from ramp placed to not placed
		if inUse:
				print("OFF")
				$CollisionShape.disabled = true
				$MeshInstance.set_surface_material(0, newMaterial)
				emit_signal("deletedBlock")
		else:
			print("ON")
			$CollisionShape.disabled = false
			$MeshInstance.set_surface_material(0, oldMaterial)
			emit_signal("addedBlock")
		inUse = !inUse

func _on_Area_entered(_area):
	#print(str($".") + " selected")
	selected = true


func _on_Area_exited(_area):
	#print(str($".") + " deselected")
	selected = false


func _on_Camera_selecting():
	if selected:
		print("sel")
		toggleUse()

func _on_Camera_deselecting():
	if selected:
		if inUse:
			print("desel")
			toggleUse()
