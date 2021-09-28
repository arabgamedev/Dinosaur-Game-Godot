extends Area2D


func _on_despawner_area_entered(area):
	area.queue_free()
