extends Node2D

var rigid=load("res://scenes/RigidBody2D.tscn")

func _input(event):
	if event.is_action_pressed("click"):
		var new_rigid=rigid.instance()
		new_rigid.position=get_viewport().get_mouse_position()
		add_child(new_rigid)
