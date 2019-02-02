extends KinematicBody2D

export (int) var speed = 0
export (float) var rotation_speed = 1.5
var brake = 0
var velocity = Vector2()
var rotation_dir = 0


func get_input():
    rotation_dir = 0
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
        rotation_dir += 1
    if Input.is_action_pressed('ui_left'):
        rotation_dir -= 1
    if Input.is_action_pressed('ui_down'):
        if brake < 1000:
           brake += 10
    if brake > 0:
       brake -= 5
    if speed < 900:
       speed += 5
    if speed < 50 and brake > 100:
       speed += 100

    velocity = Vector2(0, -speed + brake).rotated(rotation)

func _physics_process(delta):
	if global.rocket == true:
		get_item()
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	move_and_slide(velocity)
	
func get_item():
	pass