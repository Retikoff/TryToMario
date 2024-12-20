
extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -325.0
const ACCELERATION = 6

@onready var animated_sprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	#jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#get direction
	var direction = Input.get_axis("move_left", "move_right")
	
	#flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#animations
	if is_on_floor() and !is_dead:
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if is_dead:
		play_dead()
	
	#movement
	if direction != 0:
		velocity.x += ACCELERATION * direction
	else:
		velocity.x = lerp(velocity.x,0.0,0.05)
	
	velocity.x = clamp(velocity.x,-SPEED,SPEED)
	
	move_and_slide()

func play_dead():
	animated_sprite.play("dead")

func _on_area_2d_area_entered(area):
	if area.is_in_group("Portal"):
		position.x = 5033
		position.y = 380


func move_to_checkpoint():
	is_dead = false
	if position.x < 950:
		position.x = 227
		position.y = 375
	elif position.x < 2500:
		position.x = 975 
		position.y = 375
	elif position.x < 5500:
		position.x = 2950
		position.y = 375
	
