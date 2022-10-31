extends MeshInstance

export var isGoal = false
#signal win
#signal lose


#export var isGoal = false

func _get_isGoal():
	return isGoal


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _change_color(color: Color):
	var material = SpatialMaterial.new()
	material.albedo_color = color
	get_node("self").set_material(material)

