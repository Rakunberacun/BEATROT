extends Node2D

func _ready():
	$AnimationPlayer.play("Blink")

func _on_texture_button_pressed() -> void:
	$"Tunetank_comMenu-interface-selection".play()
	get_tree().change_scene_to_file("res://levels/main_menu.tscn") # Replace with function body.
