extends Control

var trashCount : int = 0
var recycleCount : int = 0

var trashLabel
var recLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	trashLabel = $"TrashCount"
	recLabel = $"RecCount"
	
	EventBus.E_O_COLLECT_TRASH.connect(_update_label_trash)
	EventBus.E_O_COLLECT_RECYCLE.connect(_update_label_recycle)
	pass # Replace with function body.

func _update_label_trash() -> void:
	trashLabel.text = "Trash - " + str(PlayerInventory.level_trash_count)

func _update_label_recycle() -> void:
	recLabel.text = "Recycle - " + str(PlayerInventory.level_recycle_count)
