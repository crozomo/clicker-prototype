class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - increases stardust created by clicker

## Load upgrade level data 
func _init() -> void:
	level = Game.ref.data.up_01_level
	title = "Clicker Upgrade"
	base_cost = 5
	calculate_cost()

## Returns description containing effects and costs
func description() -> String:
	var _description : String = "Increases the amount of stardust created by the clicker"
	_description += "\nEffects : +1 Stardust / Level"
	_description += "\nCost : %s" %cost
	
	return _description


## Returns current cost based on level and base cost
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level)) #increase cost by 1.5
	
	
## Returns whether player can afford upgrade
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost:
		return true
	
	return false

## Consumes stardust to level up
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost)
	if not error : 
		level += 1
		Game.ref.data.up_01_level = level
		
		calculate_cost()
		
		leveled_up.emit()
