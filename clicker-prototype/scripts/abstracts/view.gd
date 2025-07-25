class_name View
extends Control
## Abstract class defining a view


@export var view : UserInterface.Views
@export var user_interface : UserInterface


func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_requested)


func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
