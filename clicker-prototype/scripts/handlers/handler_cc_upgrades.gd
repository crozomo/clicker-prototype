class_name HandlerCCUpgrades
extends Node
## Manages Consciousness Core Upgrades and related signals

static var ref : HandlerCCUpgrades

## Singleton Ref
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Emitted when upgrade leveled up
signal upgrade_leveled_up(upgrade : Upgrade)

## Ref to CCUpgrades 01
@onready var u_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()

## Returns all CC upgrades
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stardust_generation,
	]
	
