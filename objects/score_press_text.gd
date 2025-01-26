extends Control


func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text 
	
	match text:
		"SIGMA":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffbe00"))
		"GYATT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
		"MOGGER":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
		"SKIBIDI":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("8dbfc7"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5a5758"))
