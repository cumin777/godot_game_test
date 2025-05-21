extends PanelContainer
class_name HistoryLog

@export var character_name_label: AdvancedTextLabel = null
@export var dialogue_label: AdvancedTextLabel = null
@export var icon: FontIcon = null

var markup: TextParser

func _ready():
	DialogueUIHelper.setup_dialogue_ui(self)

func set_labels(character: Dictionary, text: String):
	DialogueUIHelper.set_dialogue_labels(character, text, self)