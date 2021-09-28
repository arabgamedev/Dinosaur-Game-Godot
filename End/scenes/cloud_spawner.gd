extends Node2D

const CLOUD=preload("res://scenes/cloud.tscn")

func spawn():
	var new_cloud=CLOUD.instance()
	new_cloud.position.y=randf()*170
	add_child(new_cloud)
	$Timer.wait_time=rand_range(0.5,3.0)
