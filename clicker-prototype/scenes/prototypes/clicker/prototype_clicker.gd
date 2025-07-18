class_name PrototypeClicker

extends Control

var stardust : int = 0

#reference to stardust display label
@export var label : Label

#init label at launch
func _ready() -> void:
	update_label_text()

func create_stardust() -> void:
	stardust += 1
	update_label_text()

#update stardust counter label. use "%" to reference var
func update_label_text() -> void:
	label.text = "Stardust : %s" %stardust 

func _on_button_pressed() -> void:
	create_stardust()
