extends Navigation2D

var path = []
var speed = 1000
var move = false
var distance
onready var Bot = get_node("../BotPath/BothPathFollow")
onready var Player = get_node("../Player")

func _ready():
	$Rocket.hide()

func _input(event):
	if Input.is_action_pressed('ui_up') and global.rocket == true:
		_update_navigation_path(Player.position, Bot.position)
		$Rocket.show()
		global.rocket = false



func _update_navigation_path(start_position, end_position):
	path = get_simple_path(start_position, end_position, true)
	path.remove(0)
	move = true


func _process(delta):
	if move == true:
		_update_navigation_path($Rocket.position, Bot.position)
		distance = speed * delta
		move_to_target(distance)
	else:
		$Rocket.position = Vector2(Player.position.x - 400, Player.position.y - 500)

func move_to_target(distance):
	var last_point = $Rocket.position
	for index in range(path.size()):
		var distance_between_points = last_point.distance_to(path[0])
		# the position to move to falls between two points
		if distance <= distance_between_points and distance >= 0.0:
			$Rocket.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			break
		# the character reached the end of the path
		elif distance < 100:
			$Rocket.position = path[0]
			#$Rocket.hide()
			break
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)

func _on_Rocket_body_entered(body):
	print("hit")
	#$Rocket.hide()
