@tool
class_name AskPopup
extends DialoguePanel

@export var line_edit : LineEdit

var history_log := []

func _ready():
	if Engine.is_editor_hint(): return
	super._ready()
	Rakugo.sg_ask.connect(_on_ask)

func _on_ask(character:Dictionary, question:String, default_answer:String):
	set_labels(character, question)
	line_edit.placeholder_text = default_answer
	history_log = ["ask", character, question, default_answer]

func _process(_delta):
	if Engine.is_editor_hint(): return
	if Input.is_action_just_pressed("ui_accept"):
		_on_ok_btn_pressed()

func _on_default_answer_btn_pressed():
	_on_text_submitted(line_edit.placeholder_text)

func _on_ok_btn_pressed():
	if line_edit.text: _on_text_submitted(line_edit.text)
	else: _on_text_submitted(line_edit.placeholder_text)

func _on_text_submitted(new_text: String):
	Rakugo.ask_return(new_text)
	hide()
	history_log[-1] = new_text
	VisualNovelKit.add_history_log(history_log)
