extends Control

var trashCount : int = 0
var recycleCount : int = 0

var trashLabel
var recLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	trashLabel = $"TrashCount"
	recLabel = $"RecCount"
	
	EventBus.connect("E_O_COLLECT", _update_label)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_label() -> void:
	trashCount += 1
	trashLabel.text = "Trash - " + str(trashCount)
