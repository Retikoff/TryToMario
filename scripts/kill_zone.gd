extends Area2D

@onready var timer = $Timer
var entered_body: CharacterBody2D 

func _on_body_entered(body):
	entered_body = body
	body.is_dead = true
	print("You died")
	timer.start()
	
func _on_timer_timeout():
	entered_body.move_to_checkpoint()
