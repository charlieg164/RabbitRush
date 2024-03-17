extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://World/world.tscn")


func _on_area_2d_2_body_entered(body):
	$Timer.start()
	$AnimatedSprite2D.play("dead")


func _on_timer_timeout():
	queue_free()
