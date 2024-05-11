extends CharacterBody3D

@onready var agent = $NavigationAgent3D
@onready var interactable_finder = $TargetMove/InteractableFinder

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite3D

const SPEED = 6.0
const SPEED_RUN = 12.0
const JUMP_VELOCITY = 4.5
const GRAV = 100

var direction = Vector2()
var run = false

var enemy_visible = true

var input_vector: Vector2 = Vector2.ZERO

func anim_play(name_anim):
	if animation_player.current_animation != name_anim:
		animation_player.play(name_anim)

func check_():
	pass

func animation():
	if input_vector.x<0:sprite.flip_h = true
	if input_vector.x>0:sprite.flip_h = false
	
	if input_vector.length()>0.1:
		anim_play("RUN")
	else:
		anim_play("IDLE")

func saving():
	SaveManager.data["player_pos"] = global_position

func loading():
	global_position = SaveManager.data["player_pos"]

func _ready():
	SaveManager.connect("game_loading", loading)
	SaveManager.connect("game_saving", saving)
	pass

func _physics_process(delta):
	
	animation()
	
	if input_vector.length_squared() == 0:
		return
	
	if !is_on_floor():
		velocity.y-= GRAV * delta
	
	direction = (transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()
	if direction:
		velocity.x = direction.x * ((int(!run) * SPEED) + (SPEED_RUN) * int(run))
		velocity.z = direction.z * ((int(!run) * SPEED) + (SPEED_RUN) * int(run))
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	

func _input(event):
	input_vector = Vector2.ZERO

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var interactables = interactable_finder.get_overlapping_areas()
		if interactables.size() > 0:
			interactables[0].action()
			input_vector = Vector2.ZERO
			return
			
	input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
