extends RigidBody2D

var timer = 1200

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.

func _process(delta):
	if timer == 0:
		queue_free()
	if timer < 200:
		$Sprite.modulate = Color("#CD5C5C")
	timer -= 1