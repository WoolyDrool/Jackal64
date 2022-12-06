extends Camera3D

@onready var raycaster 

var interactLabel : Label
var modifierLabel : Label
var appendLabel : Label

var canGet
var x 

# Called when the node enters the scene tree for the first time.
func _ready():
	raycaster = $"RayCast"

	interactLabel = $"ImmediateUI/InteractText"
	modifierLabel = $"ImmediateUI/ModifierText"
	appendLabel = $"ImmediateUI/AppendText"

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycaster.get_collider():
		x = raycaster.get_collider()
		
		if x.name == "Interact":
			canGet = true
		else:
			canGet = false

		#if x:
		#	if x.get_children().has_node("Interact"):
		#		
		#		canGet = true
		#	else:
		#		canGet = false
			
		if canGet:
			interactLabel.text = (x.interactText)
			modifierLabel.text = "[" + x.modifierText + "]"
			appendLabel.text = "(" + x.appendText + ")"
			if Input.is_action_just_pressed("interact_general"):
				x.Interact()
				x = null
				canGet = false
	else:
		interactLabel.text = ""
		modifierLabel.text = ""
		appendLabel.text = ""
		canGet = false
		pass


