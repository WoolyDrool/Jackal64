extends Camera3D

@onready var raycaster 
var interactLabel : Label
var canGet
var x 

# Called when the node enters the scene tree for the first time.
func _ready():
	raycaster = $"RayCast"
	interactLabel = $"ImmediateUI/InteractText"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycaster.is_colliding():
		x = raycaster.get_collider()

		if x:
			if x.has_method("_on_grab"):
				canGet = true
			else:
				canGet = false
			
			if canGet:
				interactLabel.text = ("Grab " + str(x.itemName))
				if Input.is_action_just_pressed("interact_general"):
					x._on_grab()
					PlayerInventory.add_item(x)
					#x.queue_free()
					x = null
					canGet = false
	else:
		interactLabel.text = ""


