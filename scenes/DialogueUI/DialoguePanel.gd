@tool
class_name DialoguePanel
extends ProcentControl

@export var character_name_label: AdvancedTextLabel = null
@export var dialogue_label: AdvancedTextLabel = null

var markup: TextParser

func _ready() -> void:
	DialogueUIHelper.setup_dialogue_ui(self)

func set_labels(character: Dictionary, text: String):
	DialogueUIHelper.set_dialogue_labels(character, text, self)

func _on_visibility_changed():
	set_process(visible)
