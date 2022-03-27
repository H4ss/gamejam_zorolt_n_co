extends Node2D

#const PORTAL = preload("res://scenes/player/ChangeScene.tscn")
var one = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	var nb = get_tree().get_nodes_in_group("enemy2").size()
	if one == 0:	
		if $enemy2 == null:	
			print ("portal to position ", nb)
			$portal.position = $Portal2D.global_position
			one	+= 1
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
#		var portal = PORTAL.instance()
#		portal.target_stage = "res://scenes/staticscenes/victory.tscn"
#		portal.position = $Portal2D.global_position
