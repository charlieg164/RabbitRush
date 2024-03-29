extends CharacterBody2D


@export var SPEED = 20.0
var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction * SPEED

	move_and_slide()
	
	# check wall collisions
	if $RayCast2D.is_colliding():
		direction *= -1
	
	# update raycast direction
	$RayCast2D.target_position.x = 20 * direction
	
	# change sprite direction
	if direction > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false


func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("dead")
	$Timer.start()
	SPEED = 0 
	body.bounce()


func _on_timer_timeout():
	queue_free()


func _on_area_2d_2_body_entered(body):
	get_tree().change_scene_to_file("res://World/world.tscn")
