extends Node2D

@onready var player = get_parent()
@onready var bullet_point = $BulletPoint
@onready var shoot_cd = $ShootCD
@onready var gun_animations = $GunAnimations

@onready var bullet = preload("res://Scenes/Bullet.tscn")

var can_shoot = true
var damage = 2

func _physics_process(delta):
	if player.can_move:
		look_at(get_global_mouse_position())
		
		if get_global_mouse_position() < player.global_position:
			scale.y = -1
		else:
			scale.y = 1

		
		if Input.is_action_pressed("Attack"):
			if can_shoot:
				gun_animations.play("Shoot")
				var shot = bullet.instantiate()
				get_tree().get_root().get_node("World").add_child(shot)
				shot.damage = damage
				shot.global_position = bullet_point.global_position
				shot.rotation = rotation + shot.offset_rotation
				shot.start_velocity()
				shot.z_index = z_index
				can_shoot = false
				shoot_cd.start()


func _on_shoot_cd_timeout():
	can_shoot = true
