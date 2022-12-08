# Base class defining core functionality of all usable tools
# Handles boilerplate like input checking and some basic control booleans
extends Node3D

class_name UsableTool
	
var toolName = "Default"
var isEquip : bool = false
var canPrimary : bool = true
var canSecondary : bool = true
var canTertiary : bool = true

var ray
var primaryActionTimer
var secondaryActionTimer
var tertiaryActionTimer

@export var primaryActionCooldown : float
@export var secondaryActionCooldown : float
@export var tertiaryActionCooldown : float

func _get_nodes():
	ray = $"Raycaster"
	primaryActionTimer = $"ToolPrimaryCooldown"
	secondaryActionTimer = $"ToolSecondaryCooldown"
	tertiaryActionTimer = $"ToolTertiaryCooldown"

	primaryActionTimer.wait_time = primaryActionCooldown

func _process(delta):
	_process_input()
	pass

func _process_input():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_just_pressed("tool_primary") && canPrimary:
			_tool_primary()
		if Input.is_action_just_pressed("tool_secondary") && canSecondary:
			_tool_secondary()
		if Input.is_action_just_pressed("tool_tertiary") && canTertiary:
			_tool_tertiary()
	pass

# Actions
func _tool_primary() -> void:
	pass

func _tool_secondary() -> void:
	pass

func _tool_tertiary() -> void:
	pass

func _on_tool_tertiary_cooldown_timeout():
	pass # Replace with function body.

func _on_tool_secondary_cooldown_timeout():
	pass # Replace with function body.

func _on_tool_primary_cooldown_timeout():
	pass # Replace with function body.
