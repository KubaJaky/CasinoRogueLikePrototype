extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var run_particles = $Run_Particles
@onready var screen_anim = $ScreenAnim

@export var default_speed = 150
@export var max_speed = 300
var speed = default_speed
var can_move = true

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	
	if velocity != Vector2(0,0):
		sprite.play("Walk")
		speed += 5
	else:
		sprite.play("Stand")
		speed = default_speed
		
	if speed == max_speed:
		run_particles.emitting = true
	else:
		run_particles.emitting = false
		
	speed = clamp(speed, default_speed, max_speed - 5)
		
	if velocity.x < 0:
		sprite.scale.x = -2
	else:
		sprite.scale.x = 2

func _physics_process(delta):
	if can_move:
		get_input()
		move_and_slide()
	
func transition():
	can_move = false
	screen_anim.play("RoomTransition")

