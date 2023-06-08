extends Camera2D

@onready var player = $"../Player"

func _physics_process(delta):
	global_position = lerp(global_position, player.global_position, 0.1)
