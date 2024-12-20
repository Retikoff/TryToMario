class_name HelpArea

extends Area2D

@export var label: Label

func _ready():
	hideLabel()

func showLabel():
	label.visible = true

func hideLabel():
	label.visible = false

func _on_body_entered(body):
	showLabel()

func _on_body_exited(body):
	hideLabel()
