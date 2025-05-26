class_name HistoryContainer
extends VBoxContainer

signal add_history_log(args:Array)

@export var history_log_scene: PackedScene

func _ready():
	VisualNovelKit.history_container = self
	add_history_log.connect(_on_history_log)

func _on_history_log(args: Array):
	match args[0]:
		"say": _on_say(args[1], args[2])
		"ask": _on_ask_return(args[1], args[2], args[3])
		"menu": _on_menu_return(args[1])
		"notify": _on_notify(args[1])

func _on_say(character:Dictionary, text:String):
	pass

func _on_ask_return(character:Dictionary, question:String, answer:String):
	pass

func _on_menu_return(choice_text:String):
	pass

func _on_notify(notify_text:String):
	pass