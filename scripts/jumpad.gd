extends Area2D

const JUMPAD_VELOCITY := -500

func _on_body_entered(body:CharacterBody2D):
	body.velocity.y = JUMPAD_VELOCITY
