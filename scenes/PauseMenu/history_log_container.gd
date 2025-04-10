class_name HistoryContainer
extends VBoxContainer

signal history_log(args:Array)

@export var history_log_scene: PackedScene

func _ready():
	VisualNovelKit.history_container = self
	history_log.connect(_on_history_log)

func _on_history_log(args: Array):
	pass