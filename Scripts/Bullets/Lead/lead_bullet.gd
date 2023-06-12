extends RigidBody3D

func _process(delta):
	gravity_scale = 0


func _on_hitbox_body_entered(body):
	if body.name != "":
		queue_free()
