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

## Emitted when upgrade is unlocked
signal upgrade_unlocked(upgrade : Upgrade)

## Ref to CCUpgrade 01
@onready var u_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()
## Ref to CCUpgrade 02
@onready var u_02_stardust_boost : CCU02StardustBoost = CCU02StardustBoost.new()
## Ref to CCUpgrade 03
@onready var u_03_unlock_nebulas : CC03UnlockNebulas = CC03UnlockNebulas.new()

## Returns all CC upgrades
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stardust_generation,
		u_02_stardust_boost,
		u_03_unlock_nebulas,
	]



func get_all_unlocked_upgrades() -> Array[Upgrade]:
	var list : Array[Upgrade] = []
	
	for upgrade : Upgrade in get_all_upgrades():
		if upgrade.is_unlocked():
			list.append(upgrade)
			
	return list
