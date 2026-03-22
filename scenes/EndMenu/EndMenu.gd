extends Control

const GameOver_Text = "You lose..."
const Win_Text = "You won!"

const confirm_menu = "Go back to Main Menu ?"
const confirm_restart = "Restart the Game ?"
const confirm_quit = "Quit the Game ?"

@onready var end_message = %EndMessage
@onready var confirm_dialog = %ConfirmDialog
@onready var main_menu_button: Button = %MainMenuButton
@onready var restart_button = %RestartButton
@onready var exit_button: Button = %ExitButton

func _ready():
	if OS.has_feature("web"):
		exit_button.hide()
		
func set_win():
	end_message.text = Win_Text
	
func set_gameover():
	end_message.text = GameOver_Text

func _on_restart_button_pressed():
	_popup_confirm(confirm_restart, _on_confirm_restart_confirmed)

func _on_exit_button_pressed():
	_popup_confirm(confirm_quit, _on_confirm_exit_confirmed)

func _on_main_menu_button_pressed():
	_popup_confirm(confirm_menu, _on_confirm_main_menu_confirmed)

func _on_confirm_restart_confirmed():
	hide()
	SceneLoader.change_scene(get_tree().current_scene.scene_file_path)

func _on_confirm_main_menu_confirmed():
	hide()
	SceneLoader.change_scene(RGT_Globals.main_menu_setting)

func _on_confirm_exit_confirmed():
	get_tree().quit()

func _on_visibility_changed():
	if visible:
		restart_button.grab_focus()

func _popup_confirm(text: String, callback: Callable):
	confirm_dialog.dialog_text = text
	confirm_dialog.force_ok_pressed_callable(callback)
	confirm_dialog.popup_centered()
