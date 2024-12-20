extends Area2D

@export var coin: Area2D

func _on_body_entered(body):
	coin.visible = true
	coin.collision_mask = 2
	queue_free()
