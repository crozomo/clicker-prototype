class_name HandlerConsciousnessCore
extends Node
## Manages Consciousness Core and related signals

static var ref : HandlerConsciousnessCore

## Singleton Ref
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()


## Emitted when consciousness core is created/consumed
signal consciousness_core_created(quantity : int)
signal consciousness_core_consumed(quantity : int)

## Node managing stardust milestones, creating CCs
@onready var stardust_milestone : MilestoneStardust = MilestoneStardust.new()


## Get current amount of consciousness cores
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core

## Create a specific amount of consciousness cores
func create_consciousness_core(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	Game.ref.data.universe.consciousness_core += quantity
	consciousness_core_created.emit(quantity)

## Consume a specific amount of consciousness cores
func consume_consciousness_core(quantity : int) -> Error:
	if quantity > Game.ref.data.consciousness_core:
		return Error.FAILED
		
	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)

	return Error.OK
