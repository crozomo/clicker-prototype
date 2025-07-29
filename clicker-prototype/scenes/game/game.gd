class_name Game
extends Node
## Main node of the game

## Singleton reference
# can be accessed anywhere as it is a static ref
static var ref : Game

## Singleton check
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()


## Ref to the UI Packed Scene
@export var scene_user_interface : PackedScene

## Contains data to save and load
var data : Data

## Singleton check and data initialization
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()


func _ready() -> void:
	var node_user_interface : UserInterface = scene_user_interface.instantiate() as UserInterface
	add_child(node_user_interface)

## Triggered when SaveTimer completes a loop. Saves the game
func _on_save_timer_timeout() -> void:
	SaveSystem.save_data()
