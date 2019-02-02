extends Area2D

var spawntime = 0

func _process(delta):
	spawntime += delta
	if spawntime >= 10:
		spawntime = 0
		$".".show()

func _on_Pick_Up_body_entered(body):
	if body is KinematicBody2D:
		spawntime = 0
		global.rocket = true
		$".".hide()
