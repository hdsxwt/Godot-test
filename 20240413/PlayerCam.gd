extends Node3D

const SPEED = 30

func _process(delta):
	var x = Input.get_axis("ui_left", "ui_right");
	var z = Input.get_axis("ui_up", "ui_down");
	position.x += x * delta * SPEED;
	position.z += z * delta * SPEED;
	
