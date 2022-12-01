extends Node

var level_trash_count : int = 0
var level_recycle_count : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_item(item : GameItemObjective):
	if item.recycling:
		level_recycle_count += 1
	elif !item.recycling:
		level_trash_count += 1
	print_debug("Added item")
	EventBus.G_UI_UPDATECOUNTS.emit()
	pass


