@tool
extends DialoguePanel

# @export var next_btn: AdvancedTextButton

var history_log := []

func _ready():
	if Engine.is_editor_hint(): return
	super._ready()
	Rakugo.sg_say.connect(set_labels)

func _on_say(character:Dictionary, text:String):
	set_labels(character, text)
	history_log = ["say", character, text]

func _process(_delta):
	if Engine.is_editor_hint(): return
	if Input.is_action_just_pressed("ui_accept"):
		_on_next_btn_pressed()

func _on_next_btn_pressed():
	Rakugo.do_step()
	VisualNovelKit.add_history_log(history_log)
	hide()
