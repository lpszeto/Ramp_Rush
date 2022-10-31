extends Node

var ball = preload("res://Ball.tscn")
signal dropped

func _on_Ground_body_entered(_body):
	emit_signal("dropped")
	$RespawnTimer.start() 


func _on_RespawnTimer_timeout():
	var marble = ball.instance()
	$StartPosition.add_child(marble)
	connect("dropped", $"Ball", "_on_drop")
