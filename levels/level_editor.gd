extends Node2D

const in_edit_mode: bool = false
var current_level_name = "RHYTHM_HELL"

var fk_fall_time: float = 2.2
var fk_output_arr = [[], [], [], []]

var level_info = {
	"RHYTHM_HELL" = {
		"fk_times": "

[[2.06643991470337, 2.52507953643799, 3.85834484100342, 4.30630378723145, 5.6075737953186, 6.0875509262085, 7.39947872161865, 7.86879806518555, 9.17004566192627, 9.63936500549316, 10.9619501113892, 11.4099319458008, 18.3855560302734, 19.2388427734375, 19.7828109741211, 20.45478515625, 22.0760314941406, 22.7480037689209, 24.1025856018066, 25.2331970214844, 26.0864856719971, 26.6304538726807, 29.1476638793945, 31.1635597229004, 31.8461921691895, 36.2619483947754, 38.9497955322266, 43.4295700073242, 47.2053726196289, 50.5118606567383, 51.4291389465332, 55.5355766296387], [12.7218597412109, 14.9297512054443, 16.9563034057617, 17.6282775878906, 19.4841716766357, 20.0174835205078, 21.6173923492432, 23.1426532745361, 23.4519508361816, 23.5692966461182, 24.3052375793457, 24.7958953857422, 26.9931056976318, 39.3977783203125, 40.3363960266113, 40.7310417175293, 42.4909523010254, 42.9709289550781, 43.6215637207031, 44.2615211486816, 46.2880714416504, 46.9600456237793, 47.3973472595215, 47.8453300476074, 49.6052368164062, 50.0745361328125, 50.7251708984375, 51.6317909240723, 52.9010665893555, 53.285034942627, 53.6476867675781, 54.287663269043, 55.012947845459], [14.5244453430176, 16.2630165100098, 20.9880950927734, 21.3827445983887, 28.7210205078125, 30.4702499389648, 31.3875282287598, 32.2728355407715, 34.5340354919434, 35.8353050231934, 37.5952156066895, 38.5551460266113, 41.1790245056152, 41.6376655578613, 44.6881645202637, 45.189476776123, 45.6374366760254, 48.2613151550293, 48.7519500732422, 49.2212455749512, 52.5490692138672], [2.96238117218018, 3.4103630065918, 4.76494340896606, 5.17027215957642, 6.53553276062012, 6.94083862304687, 8.28476219177246, 8.71140556335449, 10.0660093307495, 10.524648475647, 11.847233581543, 12.2738779067993, 13.2124946594238, 13.8524711608887, 14.2471206665039, 15.6123817443848, 16.0070293426514, 17.1589572906494, 18.0442398071289, 27.4624031066895, 28.0810440063477, 28.4970291137695, 29.8836296081543, 30.2356002807617, 32.6141479492187, 34.0540588378906, 35.2060096740723, 35.5899780273437, 36.9979141235352, 37.3605430603027, 40.9656913757324, 41.9789779663086, 42.7256019592285, 43.8348739624023, 44.5068481445312, 46.0854194641113, 46.5227439880371, 48.0479820251465, 49.4239242553711, 49.8292282104492, 50.9491622924805, 51.8451240539551, 52.2930839538574, 53.0930603027344, 53.4663703918457, 54.063671875, 54.5116317749023]]",
		"music": load("res://music/linga guli guli.wav")
	}
}

func _ready():
	
	$MusicPlayer.stream = level_info.get(current_level_name).get("music")
	$MusicPlayer.play()
	
	if in_edit_mode:
		Signals.KeyListenerPress.connect(KeyListenerPress)
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		
		var counter: int = 0
		for key in fk_times_arr:
			
			var button_name: String = ""
			match counter:
				0:
					button_name = "button_Q"
				1:
					button_name = "button_W"
				2:
					button_name = "button_E"
				3:
					button_name = "button_R"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
			
			counter += 1

func KeyListenerPress(button_name: String, array_num: int):
	fk_output_arr[array_num].append($MusicPlayer.get_playback_position() - fk_fall_time)

func SpawnFallingKey(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)


func _on_music_player_finished():
	print(fk_output_arr)
	get_tree().change_scene_to_file("res://levels/win_condition.tscn")
	
func toggle_node_state(active: bool):
	self.set_process(active)  # Menghentikan atau melanjutkan logika _process
	self.set_visible(active)  # Menampilkan atau menyembunyikan node
