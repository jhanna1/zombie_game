extends Node

onready var zombie = load("Zombie.tscn")
var player = null
var window = OS.get_screen_size()
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("players")[0]

func _process(delta):
	if get_tree().get_nodes_in_group("zombies").size() < 5:
		make_zombie()
	pass
	
func roll_position(z):
	return randi()%int(z+1)

func make_zombie():
	var pos = player.global_position
	var x = roll_position(window.x*1.2) - (window.x * 0.1)
	var y = roll_position(window.y*1.2) - (window.y * 0.1)
	var diff = pos - Vector2(x,y)
	var m = sqrt(diff.x*diff.x + diff.y*diff.y)
	
	if(m > 300):
		var z = zombie.instance()
		z.position = Vector2(x, y)
		add_child(z)
		return