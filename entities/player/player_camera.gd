extends Camera3D

var raycaster
var interactLabel
var canGet
var x : CollisionObject3D

# Called when the node enters the scene tree for the first time.
func _ready():
	raycaster = $"RayCast"
	interactLabel = $"Control/InteractText"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycaster.is_colliding():
		x = raycaster.get_collider()
		if x.has_method("_on_grab"):
			interactLabel.set_text("Grab " + str(x))
			canGet = true
	else:
		interactLabel.set_text("")
		canGet = false

	if Input.is_action_just_pressed("interact_general") && canGet:
		if x != null:
			x._on_grab()
			x.queue_free()
			x = null
