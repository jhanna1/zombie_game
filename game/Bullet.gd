extends KinematicBody2D

var speed = 2222
var velocity = Vector2()

func _ready():
	set_as_toplevel(true)
	pass

func start(vec):
	velocity = vec.normalized() * speed

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name != "player":
			if collision.collider.has_method("kill"):
				collision.collider.kill()
				get_tree().get_root().get_node("World/Score").edit_text()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()