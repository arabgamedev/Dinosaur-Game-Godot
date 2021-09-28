extends Control

func _input(event):
	if event.is_action_pressed("ui_up") and get_tree().paused:
		get_tree().paused=false
		hide()
		get_tree().current_scene.restart()

func _on_pause_visibility_changed():
	get_tree().paused=visible
