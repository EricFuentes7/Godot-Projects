extends Control

func _ready():
	$AnimationPlayer.play("ericsi");



	


func _on_AnimationPlayer_animation_finished(ericsi):
	$AnimationPlayer2.play("start+");
	$AnimationPlayer2/AudioStreamPlayer.play()
	


func _on_AnimationPlayer2_animation_finished(anim_name):
	get_tree().change_scene("res://first.tscn")
