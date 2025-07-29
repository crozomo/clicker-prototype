class_name UserInterface

extends Control

#list of views
enum Views {
	PROTOTYPE_GENERATOR, 
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
	CONSCIOUSNESS_CORE,
}

#emitted when navigation requested
signal navigation_requested(view : Views)


#triggered when generator link is clicked
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

#triggered when clicker link is clicked
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

#triggered when upgrades link is clicked
func _on_prototype_upgrades_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)

#triggered when consciousness core link is clicked
func _on_consciousness_core_link_pressed() -> void:
	navigation_requested.emit(Views.CONSCIOUSNESS_CORE)
