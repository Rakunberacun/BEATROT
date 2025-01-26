extends Node2D

var master_bus = AudioServer.get_bus_index("Master")


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, value)
	$"Daneben-105534[cut1Sec]2".play()
	if value == -50:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus,false)


func _on_texture_button_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/main_menu.tscn") # Replace with function body


func _on_texture_button_mouse_entered() -> void:
	$"Daneben-105534[cut1Sec]".play()
