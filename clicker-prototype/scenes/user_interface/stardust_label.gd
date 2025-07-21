class_name LabelStardust
extends Label
## Displays current stardust ammount available


## Connecting signals
func _ready() -> void:
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

## Update text for current amount of stardust
func update_text(_quantity : int = -1) -> void:
	text = "Stardust : %s" %HandlerStardust.ref.stardust()
