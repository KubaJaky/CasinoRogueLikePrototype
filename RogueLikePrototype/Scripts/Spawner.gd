extends Node2D

@onready var enemy = preload("res://Scenes/Enemy.tscn")

var enemy_count = randi_range(1,3)
var last_position_x
var last_position_y

func _ready():
	randomize()
	for n in enemy_count:
		var range = 60
		
		var enemy_position_x = randi_range(-range,range)
		var enemy_position_y = randi_range(-range,range)
		
		while enemy_position_x == last_position_x and enemy_position_y == last_position_y:
			enemy_position_x = randi_range(-range,range)
			enemy_position_y = randi_range(-range,range)
			
		last_position_x = enemy_position_x
		last_position_y = enemy_position_y
		
		var foe = enemy.instantiate()
		get_tree().get_root().get_node("World").call_deferred("add_child", foe)
		foe.global_position = self.global_position + Vector2(enemy_position_x,enemy_position_y)
		
		

