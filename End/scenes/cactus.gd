extends Area2D

func _ready():
	connect("body_entered",self,"body_enter")
	$Sprite.frame=randi()% $Sprite.hframes

func _physics_process(delta):
	position.x-=get_tree().current_scene.speed

func body_enter(body):
	if body.name!="player":
		return
	body.death()
