extends HitState

class_name HitState_builder
@onready var builder = $"../.." as builder

signal dropHammer

func _ready():
	hitbox_component.connect("on_hit", _on_hit_box_component_on_hit)
	
func on_enter():
	timer.start()
	playback.travel(hit_animation_node)
	
func on_exit():
	next_state = return_state
	playback.travel(return_animation_name)
	character.velocity = Vector2.ZERO

func _on_hit_box_component_on_hit(knockback: Vector2):
	character.velocity = knockback
	dropHammer.emit()

func _on_timer_timeout():
	next_state = return_state
	playback.travel(return_animation_name)
	character.velocity = Vector2.ZERO
