class_name MilestoneStardust
extends Node
## Generates Consciousness Cores for every X amount of stardust created


## Amount of stardust needed to create the next CC
var stardust_goal : int = -1
## Amount of stardust generated since the last milestone
var stardust_progress : int = -1

## Ref to Universe data
var universe : DataUniverse


func _init() -> void:
	universe = Game.ref.data.universe
	HandlerStardust.ref.stardust_created.connect(_on_stardust_created)
	initialize_new_milestone(universe.stardust_milestone_progress)


## Init a new milestone once previous one is completed
func initialize_new_milestone(transfered_progress : int = 0) -> void:
	if universe.consciousness_core == 0:
		stardust_goal = 4
		
	else:
		stardust_goal = universe.consciousness_core * 8
	
	stardust_progress = transfered_progress
	universe.stardust_milestone_progress = stardust_progress
	

## Checks for milestone completion
func check_for_completion() -> void:
	if stardust_progress < stardust_goal:
		return
		
	var stardust_excess : int = stardust_progress - stardust_goal
	
	HandlerConsciousnessCore.ref.create_consciousness_core(1)
	
	initialize_new_milestone(stardust_excess)
	check_for_completion()
	

## Triggered when stardust is created. Progresses the milestone
func _on_stardust_created(quantity : int) -> void:
	stardust_progress += quantity
	universe.stardust_milestone_progress = stardust_progress
	
	
	check_for_completion()
