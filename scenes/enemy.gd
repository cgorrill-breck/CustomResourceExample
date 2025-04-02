extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 10;

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func die() -> void:
	if health <= 0:
		queue_free()

func _on_hurt_box_hurt(hitbox: HitBox, damage: int) -> void:
	print("enemy was hit")
	health -= damage
	print("health: " + str(health))
	die()
