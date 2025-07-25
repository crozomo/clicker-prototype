class_name PrototypeClicker
extends View #extends to the view.gd script


#init label at launch
func _ready() -> void:
	super() #order to follow ready func in view.gd (connects signal to nav request). 
	#Super() is needed to use visible = false 
	visible = false


## Create 1 stardust
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()

func _on_button_pressed() -> void:
	create_stardust()
