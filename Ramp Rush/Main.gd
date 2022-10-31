extends Node

var ball = preload("res://Ball.tscn")
var live_ball = false
signal dropped

func _ready():
	var blocks = get_tree().get_nodes_in_group("block")
	#print(str(blocks))
	for x in blocks:
		$Camera.connect("selecting", x, "_on_Camera_selecting")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if !live_ball:
			live_ball = true
			$RespawnTimer.start() 

#func _on_Ground_body_entered(_body):
	#emit_signal("dropped")
	#live_ball = false


func _on_RespawnTimer_timeout():
	var marble = ball.instance()
	$StartPosition.add_child(marble)
	#connect("dropped", $"Ball", "_on_drop")
