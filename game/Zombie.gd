extends KinematicBody2D

const MOVE_SPEED = 200

onready var raycast = $RayCast2D

var player = null

var vec_to_player = null

func _ready():
	add_to_group("zombies")
	player = get_tree().get_nodes_in_group("players")[0]

func _physics_process(delta):		
	if player == null:
		return
	
	vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			coll.kill()
		
func kill():
	get_tree().get_root().get_node("World/loot_spawner").spawn(global_position)
	queue_free()

func set_player(p):
	player = p