class_name UserInterface

extends Control

#list of views
enum Views {
	PROTOTYPE_GENERATOR, 
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
}

#emitted when navigation requested
signal navigation_requested(view : Views)


#triggered when generator link is clicked
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

#triggered when clicker link is clicked
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

#triggered whwn upgrades link is clicked
func _on_prototype_upgrades_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)
