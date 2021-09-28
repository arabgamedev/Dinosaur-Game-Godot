extends KinematicBody2D

const JUMP_H=-700
const GRAVITY=40
var motion:Vector2
enum {RUN,JUMP,CROUCH}
var state=RUN

onready var game=get_tree().current_scene
func _physics_process(_delta):
	motion.y+=GRAVITY*(_delta*60)
	match state:
		RUN:
			$sprite.play("run")
			if Input.is_action_pressed("ui_up"):
				game.add_sfx("jump")
				motion.y=JUMP_H
				state=JUMP
			elif Input.is_action_pressed("ui_down"):
				state=CROUCH
		JUMP:
			$sprite.play("jump")
			if is_on_floor():
				state=RUN
		CROUCH:
			$sprite.play("crouch")
			if Input.is_action_just_released("ui_down"):
				state=RUN
	$top_Collision.disabled=(state==CROUCH)
	motion=move_and_slide(motion,Vector2.UP)

func death():
	$sprite.play("death")
	game.death()

func reset():
	position=$start_pos.global_position
	state=RUN


