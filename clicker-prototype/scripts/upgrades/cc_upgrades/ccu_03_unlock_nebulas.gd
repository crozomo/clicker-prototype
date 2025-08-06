class_name CC03UnlockNebulas
extends Upgrade
## CC Upgrade 03 : Unlocks Nebulas

var max_level : int = 1

## Init values
func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_03_unlock_nebulas
	title = "Unlock Nebulas"
	base_cost = 5
	cost = 5

	if not is_unlocked():
		HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)

## Returns upgrade description
func description() -> String:
	var text : String = "[b]Effects :[/b] Unlock the ability to create Nebulas"
	
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Consciousness Cores" %cost
	
	return text


## Returns whether player can afford upgrade
func can_afford() -> bool:
	if level >= max_level:
		return false
	
	if Game.ref.data.consciousness_core >= cost:
		return true
		
	return false


## Consumes consciousness cores to level up
func level_up() -> void:
	if level >= max_level:
		return
	
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	
	if error:
		return
		
	level += 1 
	Game.ref.data.cc_upgrades.u_03_unlock_nebulas = true
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)


## Returns whether upgrade is unlocked
func is_unlocked() -> bool:
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		return true
	
	return false


## Triggered when CCU01 is purchased. Unlocks this upgrade
func _on_ccu01_level_up() -> void:
	HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.disconnect(_on_ccu01_level_up)
	HandlerCCUpgrades.ref.upgrade_unlocked.emit(self)
