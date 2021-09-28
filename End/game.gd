extends Control

const INCEASE=.002
const SPEED0=4
const LIMIT=15
var speed=SPEED0
var crr_distance=0
var target_distance=500
var score:float
var hi_score:int

func _ready():
	randomize()
	get_tree().paused=true

func _physics_process(_delta):
	print(_delta)
	if speed<LIMIT:
		speed+=INCEASE*(_delta*60)
	$ground/sprite.region_rect.position.x+=speed*(_delta*60)
	
	crr_distance+=speed
	if crr_distance>=target_distance:
		$spawner.spawn()
		crr_distance=0
		target_distance= rand_range(250,450)
		
	score+=speed/20
	if int(score)%100==0:
		add_sfx("score")
	update_score()

func death():
	if score>hi_score:
		hi_score=int(score)
		update_score()
	add_sfx("death")
	$ui/pause.show()

func update_score():
	$ui/hbox/score.text="%s"% str(int(score)).pad_zeros(5)
	$ui/hbox/hi_score.text="Hi %s"% str(hi_score).pad_zeros(5)

func restart():
	$player.reset()
	speed=SPEED0
	score=0
	$spawner.clear()

func add_sfx(_str):
	if $ui/pause.has_node(_str):
		return
	var new_sfx=AudioStreamPlayer.new()
	new_sfx.stream=load("res://sfx/%s.wav" % _str)
	new_sfx.name=_str
	$ui/pause.add_child(new_sfx)
	new_sfx.play()
	new_sfx.connect("finished",self,"_queue_free",[new_sfx])

func _queue_free(node):
	node.queue_free()

