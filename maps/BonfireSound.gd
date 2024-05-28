extends AudioStreamPlayer3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Shortcuts.start_compfire_sound.connect(play_sound)

func play_sound():
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
