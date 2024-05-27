extends CharacterBody3D

@onready var agent = $NavigationAgent3D
@onready var eye_zone = $EYE_ZONE
@onready var pick_up = $"../books/TestItemBook4/PickUp"
@onready var checkpoint = $"../Checkpoint"

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAV = 100

var moving = false
var move_point = Vector3()
var direction = Vector3()
var player : Node
@onready var player_forward = $"../PlayerForward"

func check_eyes():
	eye_zone.global_rotation.y = Vector2.ZERO.angle_to_point(Vector2(direction.z, direction.x)) - PI/2
	var obstacle_detected = false
	var target_position = null
	var closest_obstacle = null

	# Initialize player if it's not already set
	for b in eye_zone.get_overlapping_bodies():
		if b.is_in_group("player") and b.enemy_visible:
			player = b
			break

	if not player:
		return  # If player is not found, exit the function

	# Raycast from the enemy's position to the player's position
	var space_state = get_world_3d().direct_space_state
	
	var ray_parameters = PhysicsRayQueryParameters3D.new()
	ray_parameters.from = global_position
	ray_parameters.to = player.global_position
	ray_parameters.to.y += 0.5
	ray_parameters.exclude = [self]
	ray_parameters.hit_from_inside = true
	
	var raycast_result = space_state.intersect_ray(ray_parameters)
	if raycast_result:
		print(ray_parameters.from, ray_parameters.to, raycast_result.collider, player)
	if raycast_result and raycast_result.collider.is_in_group("player"):
		target_position = player.global_position
		player = raycast_result.collider
	else:
		obstacle_detected = true
		player = null

func set_move_point(pos):
	agent.target_position = pos
	
func get_move_point():
	return agent.target_position

func is_in_move_point():
	return agent.is_navigation_finished()

func _physics_process(delta):
	if player != null:
		if player.enemy_visible:
			set_move_point(player.global_position)
			agent.target_desired_distance = 2
			if not agent.is_target_reachable():
				player = null
			
			if player != null and (global_position - player.global_position).length() <= 1.5:
				catch_player()
				set_move_point(global_position)
		else:
			player == null
			agent.target_desired_distance = 0.1
	else:
		check_eyes()
		agent.target_desired_distance = 0.1
	if not is_on_floor():
		velocity.y -= GRAV * delta
	
	direction = Vector3()
	
	direction = agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = direction * SPEED
	
	if moving:
		if direction.x<0:rotation = Vector3(0, PI, 0)
		if direction.x>0:rotation = Vector3(0, 0, 0)
		
		move_and_slide()


var timer := Timer.new()

func _ready():
	add_child(timer)
	timer.wait_time = 1.0
	Shortcuts.fade_out.emit()

func catch_player():
	player.anim_play("IDLE")
	await get_tree().create_timer(0.01).timeout
	get_tree().paused = true
	Shortcuts.fade_in.emit()
	await Signal(Shortcuts.faded_in)
	pick_up.enable()
	Shortcuts.clear_inventory()
	player.global_position = checkpoint.global_position
	player_forward.global_position = player.global_position
	player.direction = Vector2.ZERO
	player = null
	timer.process_mode = 3
	timer.start()
	await timer.timeout
	Shortcuts.fade_out.emit()
	await Signal(Shortcuts.faded_out)
	get_tree().paused = false
