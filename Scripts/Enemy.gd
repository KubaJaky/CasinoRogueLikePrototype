extends CharacterBody2D

var max_hp = 20
var hp = max_hp

func death_check():
	if hp <= 0:
		queue_free()

