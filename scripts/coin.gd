extends Area2D


func _ready():
	visible = false

func _on_body_entered(body):
	print("+1 coin")
	queue_free()
