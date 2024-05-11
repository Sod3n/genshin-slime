extends Node3D

@export var music_1 : AudioStreamMP3
@export var music_2 : AudioStreamMP3

@onready var audio_1 = $AudioStreamPlayer
@onready var audio_2 = $AudioStreamPlayer2

func _ready():
	audio_1.stream = music_1
	audio_2.stream = music_2
	audio_1.play()
	audio_2.play()

