extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_sprite: Sprite2D = $AttackSprite
var is_attacking = false  # Prevents attack spamming
var facing_right = true  # Tracks which direction the player is facing
@onready var hit_box: HitBox = $HitBox
@export var damage = 10

func _ready():
	attack_sprite.visible = false  # Hide the attack sprite initially
	set_damage()
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	handle_jump(delta)
	handle_movement(delta)
	handle_attack()

	move_and_slide()

func handle_attack():
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true  # Lock input
		
		# Flip attack sprite based on facing direction
		attack_sprite.visible = true
		if facing_right:
			animation_player.play("attack_right")
		else:
			animation_player.play("attack_left")
			
		await animation_player.animation_finished 
		
		attack_sprite.visible = false
		is_attacking = false  # Unlock input
		
func handle_movement(delta: float):
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
		# Update facing direction
		if direction > 0:
			facing_right = true
		elif direction < 0:
			facing_right = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func handle_jump(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
func _on_hurt_box_hurt(hitbox: HitBox, damage: int) -> void:
	print("player was hit")
	pass  # Replace with function body.

func set_damage():
	hit_box.damage = damage
