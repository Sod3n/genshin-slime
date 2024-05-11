extends CharacterBody3D

@onready var agent = $NavigationAgent3D
@onready var eye_zone = $EYE_ZONE

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAV = 100

var moving = false
var move_point = Vector3()
var direction = Vector3()
var player : Node

func check_eyes():
	eye_zone.global_rotation.y = Vector2.ZERO.angle_to_point(Vector2(direction.z, direction.x)) - PI/2
	for b in eye_zone.get_overlapping_bodies():
		if b.is_in_group("player"):
			if b.enemy_visible:
				agent.target_position = b.global_position
				player = b

func set_move_point(pos):
	agent.target_position = pos
	
func get_move_point():
	return agent.target_position

func is_in_move_point():
	return global_position.distance_to(agent.target_position)<5

func _physics_process(delta):
	if player != null:
		if player.enemy_visible:
			set_move_point(player.global_position)
		else:
			player == null
	else:
		check_eyes()
	if not is_on_floor():
		velocity.y -= GRAV * delta
	
	direction = Vector3()
	
	direction = agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = direction * SPEED
	
	move_and_slide()
