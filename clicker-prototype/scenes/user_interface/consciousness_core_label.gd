class_name LabelConsciousnessCore
extends Label
## Displays current amount of consciousness cores

## Connecting signals
func _ready() -> void:
	update_text()
	HandlerConsciousnessCore.ref.consciousness_core_created.connect(update_text)
	HandlerConsciousnessCore.ref.consciousness_core_consumed.connect(update_text)

## Update text for current amount of consciousness cores
func update_text(_quantity : int = -1) -> void:
	text = "Consciousness Cores : %s" %HandlerConsciousnessCore.ref.consciousness_core()
