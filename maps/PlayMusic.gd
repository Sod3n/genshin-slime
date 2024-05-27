extends Area3D
@export var theme_to_play: AudioStreamPlayer
@export var theme_to_stop: AudioStreamPlayer
@export var theme_to_stop2: AudioStreamPlayer
@export var only_when_stop: bool
@export var value: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("enter")
	if body.is_in_group('player'):
		print("player")
		if not theme_to_play.volume_db == value and (theme_to_stop.volume_db != -80 or not only_when_stop):
			theme_to_play.volume_db = value
			if theme_to_stop:
				theme_to_stop.volume_db = -80
			if theme_to_stop2:
				theme_to_stop2.volume_db = -80
