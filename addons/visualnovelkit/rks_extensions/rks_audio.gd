extends RKSExtension

var vnk = VisualNovelKit

const Audio := "audio"
const PlayAudio := "play audio"
const SeekAudio := "seek audio"
const StopAudio := "stop audio"

const regex := {
	PlayAudio: "play +({NAME}) +({NAME})( +{NUMERIC})?",
	SeekAudio: "seek +({NAME})",
	StopAudio: "stop +({NAME})",
}

func _group_name() -> StringName:
	return Audio

func _ready():
	for key in regex: Rakugo.add_custom_regex(key, regex[key])
	super._ready()

func _on_custom_regex(key: String, result: RegExMatch):
	if key not in regex: return
	if result.get_group_count() == 0:
		push_error(err_mess_01 % [key, group_name])
		return
	
	match key:
		PlayAudio:
			var node := rk_get_node(result.get_string(1))
			if !node: return

			var audio_name := result.get_string(2)
			var speed := float(result.get_string(3))
			if result.get_string(3).is_empty(): speed = 1
			
			if speed == 0:
				push_error("you try to play audio with 0 speed")
				return

			if speed > 0: node.play(audio_name, speed)
			elif speed < 0: node.play(audio_name, speed, true)

		SeekAudio:
			var node := rk_get_node(result.get_string(1))
			if !node: return
			node.seek()
		
		StopAudio:
			var node := rk_get_node(result.get_string(1))
			if !node: return
			node.stop()
