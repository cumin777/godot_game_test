class_name DialogueUIHelper

static func setup_dialogue_ui(ui: Control):
	if "markup" not in ui:
		push_error("%s is not proper DialogueUI,
			missing markup" % ui.name)
		return

	if "character_name_label" not in ui:
		push_error("%s is not proper DialogueUI,
			missing character_name_label" % ui.name)
		return
	
	if "dialogue_label" not in ui:
		push_error("%s is not proper DialogueUI,
			missing dialogue_label" % ui.name)
		return

	ui.markup = load(VisualNovelKit.default_markup_setting)
	if ui.character_name_label:
		ui.character_name_label.parser = ui.markup
	
	if ui.dialogue_label:
		ui.dialogue_label.parser = ui.markup

	ui.visibility_changed.connect(ui._on_visibility_changed)
	
	ui.visible = Engine.is_editor_hint()
	ui.set_process(false)

static func set_dialogue_labels(character: Dictionary, text: String, ui: Control):
	ui.show()
	
	var character_name = character.get("name", "")

	if not character_name:
		ui.character_name_label._text = ""
	
	else:
		var name_label = "[h1]%s[/h1]" % character_name

		if ui.markup is MarkdownParser:
			name_label = "# %s\n" % character_name

		var character_color = character.get("color", null)
		
		if character_color:
			name_label = "[color=%s]%s[/color]" % [character_color, name_label]
		
		ui.character_name_label._text = name_label
	
	ui.dialogue_label._text = text
