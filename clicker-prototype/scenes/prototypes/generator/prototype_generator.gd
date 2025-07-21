class_name PrototypeGenerator

extends Control

#binds nodes to editor in inspector
@export var button : Button
@export var timer : Timer

#view reference
@export var view : UserInterface.Views
#UI reference
@export var user_interface : UserInterface

func _ready() -> void:
	visible = true
	
	user_interface.navigation_requested.connect(_on_navigation_requested)


func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)

func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

func _on_button_pressed() -> void:
	begin_generating_stardust()


func _on_timer_timeout() -> void:
	create_stardust()

#watches for navigation requests and acts accordingly
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
	
