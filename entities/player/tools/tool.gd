# Base class defining core functionality of all usable tools
# Handles boilerplate like input checking and some basic control booleans
extends Node3D

class_name UsableTool
	
var toolName = "Default"
var isEquip : bool = false
var canUSe : bool = true

var ray
var primaryActionTimer
var secondaryActionTimer
var tertiaryActionTimer

func _ready():
	ray = $"Raycaster"
	primaryActionTimer = $"ToolPrimaryCooldown"
	secondaryActionTimer = $"ToolSecondaryCooldown"
	tertiaryActionTimer = $"ToolTertiaryCooldown"

func _process(delta):
	_process_input()
	pass

func _process_input():
	if Input.is_action_just_pressed("tool_primary"):
		_tool_primary()
	if Input.is_action_just_pressed("tool_secondary"):
		_tool_secondary()
	if Input.is_action_just_pressed("tool_tertiary"):
		_tool_tertiary()
	pass

# Actions
func _tool_primary() -> void:
	pass

func _tool_secondary() -> void:
	pass

func _tool_tertiary() -> void:
	pass