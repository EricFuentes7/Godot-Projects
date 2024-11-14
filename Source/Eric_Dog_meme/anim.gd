extends Control

func _ready():
	$AnimationPlayer.play("intro")


func _on_Button_pressed():
	$ColorRect/AnimatedSprite.play("woof")
	$VBoxContainer/Button/AudioStreamPlayer.play()
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://info.tscn")

