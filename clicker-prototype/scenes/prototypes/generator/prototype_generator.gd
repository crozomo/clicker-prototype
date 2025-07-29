class_name PrototypeGenerator
extends View

#binds nodes to editor in inspector
@export var button : Button
@export var timer : Timer

func _ready() -> void:
	super()
	visible = true


func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)

func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

func _on_button_pressed() -> void:
	begin_generating_stardust()


func _on_timer_timeout() -> void:
	create_stardust()
