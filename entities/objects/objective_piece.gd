extends Area3D

class_name GameItemObjective

@export var itemName : String = "Default"
@export var recycling : bool = false

func _on_grab():
	if !recycling:
		PlayerInventory.level_trash_count += 1
		EventBus.E_O_COLLECT_TRASH.emit()
	else:
		PlayerInventory.level_recycle_count += 1
		EventBus.E_O_COLLECT_RECYCLE.emit()
	queue_free()
