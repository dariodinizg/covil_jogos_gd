extends Node3D

const HANDLER_NAME = ""

@export var bullet_speed = 10
@export var shot_range = 8.0
@export var ammo_amount = 6

func _process(delta):
	# For debug pourpose only
	if Input.is_action_just_pressed("shoot"):
		shoot(ammo_type["lead"])

func _ready():
	$ShotRange/ShotRangeArea.shape.radius = shot_range

var ammo_type = {
	"lead":preload("res://Scenes/Bullets/Lead/lead_bullet.tscn")
}

func shoot(_ammo_type):
	var bullet_instance = _ammo_type.instantiate()
	bullet_instance.position = $BulletOrigin.position
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector3.FORWARD * bullet_speed, Vector3(0,0,0))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
	
func connect_itself(_handler_name):
	# Searches the tree for the handler node name and connects its signals.
	# Returns its handler node.
	pass
	
	
func disconnect_itself():
	# Execute some methods before free itself
	pass


func _on_shot_range_body_exited(body):
	body.queue_free()
