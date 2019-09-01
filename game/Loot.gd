extends Area2D

var color = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_color(colorin):
	color = colorin
	$Particles2D.process_material.color = Color(colorin)

func _on_Loot_body_entered(body):
	if body.is_in_group("players"):
		if color == "#9f6934":
			get_tree().get_root().get_node("World/Player").add_barr()
		if color == "#CC00FF":
			get_tree().get_root().get_node("World/Player").add_ammo(randi()%2+0)
		queue_free()