extends Node2D


func _on_texture_button_1_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/game_level.tscn")


func _on_texture_buttonkedua_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/game_level_2.tscn")


func _on_texture_buttonketiga_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/game_level_3.tscn")


func _on_texture_button_1_mouse_entered() -> void:
	$"Daneben-105534[cut1Sec]".play() # Replace with function body.


func _on_texture_buttonkedua_mouse_entered() -> void:
	$"Daneben-105534[cut1Sec]".play()# Replace with function body.


func _on_texture_buttonketiga_mouse_entered() -> void:
	$"Daneben-105534[cut1Sec]".play() # Replace with function body.
