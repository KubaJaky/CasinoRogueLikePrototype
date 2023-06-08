extends Area2D

@onready var world = get_parent().get_parent()
@onready var body = world.get_node("Player")

func _process(delta):
	if get_tree().get_nodes_in_group("Enemy").size() <= 0:
		if (overlaps_body(body)):
			if Input.is_action_just_pressed("Use"):
				body.transition()

