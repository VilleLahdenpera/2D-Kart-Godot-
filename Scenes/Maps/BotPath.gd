extends Path2D

var RayNode
var speed = 0
onready var follow = get_node("BothPathFollow")

func _ready():
	set_process(true)

func _process(delta):
	if speed < 700:
		speed += 5
	follow.set_offset(follow.get_offset() + speed * delta)
	
	
