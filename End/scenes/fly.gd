extends Area2D

func _ready():
	connect("body_entered",self,"body_enter")
	position.y=-randi()%3*20

func _physics_process(delta):
	position.x-=get_tree().current_scene.speed+.5

func body_enter(body):
	if body.name!="player":
		return
	body.death()
