extends Area2D

@onready var animation_player = $"../AnimationPlayer"
@onready var timer = $"../Timer"


func _on_body_entered(body):
	timer.start()
func _on_body_exited(body):
	queue_free()

func _on_timer_timeout():
	animation_player.play("moving")
