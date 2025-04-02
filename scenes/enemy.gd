extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var enemy_stats : Stats



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func die() -> void:
	if enemy_stats.get_health() <= 0:
		queue_free()

func _on_hurt_box_hurt(hitbox: HitBox, damage: int) -> void:
	print("enemy was hit")
	enemy_stats.set_health(enemy_stats.get_health() - damage)
	print("health: " + str(enemy_stats.get_health()))
	die()
