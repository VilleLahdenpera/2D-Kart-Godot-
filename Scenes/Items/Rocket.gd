extends Area2D

var endpos
var startpos = Vector2(0,0)


func _process(delta):
	endpos = $".".position
	rotate_sprite(endpos, startpos)
	startpos = endpos

func rotate_sprite(start, finish):
	var angle = start.angle_to_point(finish)
	$Sprite.set_rotation(angle + 1.6)
