extends Node2D

const elements=[
	"res://scenes/cactus_0.tscn",
	"res://scenes/cactus_1.tscn",
	"res://scenes/cactus_2.tscn",
	"res://scenes/cactus_3.tscn",
	"res://scenes/cactus_4.tscn",
	"res://scenes/cactus_5.tscn",
	"res://scenes/fly.tscn",
]

func spawn():
	var rand_type=randi()%elements.size()
	var new_cactus=load(elements[rand_type])
	$elements.add_child(new_cactus.instance())

func clear():
	for child in $elements.get_children():
		child.queue_free()
