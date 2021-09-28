

extends RigidBody2D

func _ready():
	update()
	weight=randf()*20

func _draw():
	draw_circle(Vector2(),10,Color("4f0"))
