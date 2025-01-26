extends Control


func _ready():
	$Total_Score.text = "Total Aura: " + str(Global.total_score) + "!!!!"


func _on_texture_button_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/main_menu.tscn") # Replace with function body. # Replace with function body.

func _on_texture_button_mouse_entered() -> void:
	$"Daneben-105534[cut1Sec]".play()
