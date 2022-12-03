extends Control

var phase2 : bool = false

var container1
var container2
var lock

# Called when the node enters the scene tree for the first time.
func _ready():
	container1 = $"Phase1"
	container2 = $"Phase2"
	lock = $"Phase1/Lock"

	container1.visible = true
	container2.visible = false
	lock.connect("E_O_UNLOCKED", _enter_phase2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _enter_phase2():
	container1.visible = false
	container2.visible = true
