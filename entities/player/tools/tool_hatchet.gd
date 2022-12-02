extends UsableTool

func _ready():
	_get_nodes()

func _tool_primary() -> void:
	canPrimary = false
	if primaryActionTimer:
		primaryActionTimer.start()

func _on_tool_primary_cooldown_timeout():
	canPrimary = true
