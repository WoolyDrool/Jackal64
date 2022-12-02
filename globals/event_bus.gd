extends Node


# Tell Godot to ignore warnings of unused signals
#warning-ignore:unused_signal

# Style Guide ------------------
# prefixes: E (Entity) , P (Player) , G (Game)
# modifiers: O (Objective), UI (User Interface), T (Trail)

# List of published signals
signal E_O_COLLECT_TRASH
signal E_O_COLLECT_RECYCLE

signal G_UI_UPDATE_COUNTS

signal G_T_BEGIN_TRAIL
signal G_T_END_TRAIL