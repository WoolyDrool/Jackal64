extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state


func process_input():
	if Input.is_action_just_pressed("interact_general"):
		enabled = true
		
		
