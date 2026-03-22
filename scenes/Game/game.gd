extends Node
class_name Game

const DEMO_SCRIPT_PATH := "res://story/demo.rk"
const DEMO_SCRIPT_NAME := "demo"

@onready var pause_menu: Control = %PauseMenu
@onready var end_menu: Control = %EndMenu
@onready var dialogue_ui: Control = %DialogueUI

func _ready() -> void:
	RGT_Globals.game = self
	if not Rakugo.sg_execute_script_finished.is_connected(_on_story_finished):
		Rakugo.sg_execute_script_finished.connect(_on_story_finished)

	if _try_resume_saved_game():
		return

	Rakugo.parse_and_execute_script(DEMO_SCRIPT_PATH)

func show_pause_menu():
	dialogue_ui.hide()
	pause_menu.show()
	pause_menu.set_process(true)
	get_tree().paused = true

func hide_pause_menu():
	pause_menu.set_process(false)
	get_tree().paused = false
	pause_menu.hide()
	await get_tree().process_frame
	dialogue_ui.show()

func _process(_delta):
	if end_menu.visible:
		return
	if Input.is_action_just_pressed("ui_cancel"):
		if !pause_menu.visible: show_pause_menu()
		else: hide_pause_menu()

func _try_resume_saved_game() -> bool:
	if SaveHelper.save_file_name_to_load.is_empty():
		return false

	var save_name := SaveHelper.save_file_name_to_load
	SaveHelper.save_file_name_to_load = ""

	if SaveHelper.load(save_name) != OK:
		return false
	if Rakugo.apply_save_data(SaveHelper.last_loaded_data) != OK:
		return false

	return Rakugo.resume_loaded_script() == OK

func _on_pause_menu_ask_to_save():
	pause_menu.save_this_please(Rakugo.get_save_data())

func _on_story_finished(file_name: String, error_str: String):
	if file_name != DEMO_SCRIPT_NAME:
		return

	dialogue_ui.hide()
	end_menu.show()
	if error_str.is_empty():
		end_menu.set_win()
	else:
		push_error(error_str)
		end_menu.set_gameover()
