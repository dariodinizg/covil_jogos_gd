extends Node3D

const HANDLER_NAME = ""

@export var bullet_speed = 100
@export var shot_range = 20
@export var ammo_amount = 6

func _ready():
	$ShotRange/ShotRangeArea.radius = shot_range

var ammo_type = {
	"lead":"preload()"
}

func shoot(_ammo_type):
	var bullet_instance = _ammo_type.instance()
	bullet_instance.position = $BulletOrigin.position
	bullet_instance.rotation_degrees = rotation_degrees
#	bullet_instance.apply_impulse(Vector3(0,0,bullet_speed).rotated(rotation), Vector3())
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
	
func connect_itself(_handler_name):
	# Searches the tree for the handler node name and connects its signals.
	# Returns its handler node.
	pass
	
	
func disconnect_itself():
	# Execute some methods before free itself
	pass


func _on_shot_range_body_exited(body):
	if "bullet" in body.name:
		body.queue_free()
