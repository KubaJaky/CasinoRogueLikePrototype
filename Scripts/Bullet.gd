extends CharacterBody2D

@onready var state = $State
@onready var fade_timer = $FadeTimer

@export var bullet_speed = 50

var damage

@onready var offset_rotation = randf_range(-0.2,0.2)

func _ready():
	fade_timer.start()
	
func start_velocity():
	velocity = Vector2(bullet_speed*5, 0).rotated(rotation)

func _physics_process(delta):
	velocity += Vector2(bullet_speed, 0).rotated(rotation)
	move_and_slide()

func _on_fade_timer_timeout():
	state.play("Fade")


func _on_hurt_area_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hp -= damage
		body.death_check()
		queue_free()
