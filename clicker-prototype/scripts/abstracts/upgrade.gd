class_name Upgrade
extends Node
## Abstract class defining an upgrade

## Emitted when leveled up
signal leveled_up

## Upgrade level
var level : int = -1
## Upgrade title
var title : String = "Title Not Defined"
## Upgrade base cost
var base_cost : int = -1
var cost : int = -1


## Virtual class - must be overwritten. [br]
## Returns upgrade description
func description() -> String:
	return "Description Not Defined"
#red dots on the left are break points - game will break if this error is returned

## Virtual class - must be overwritten. [br]
## Returns current cost based on level and base cost
func calculate_cost() -> void:
	printerr("calculate_cost() method not defined")
#printerr = print error

## Virtual class - must be overwritten. [br]
## Returns whether player can afford upgrade
func can_afford() -> bool:
	return false


## Virtual class - must be overwritten. [br]
## Consumes stardust to level up
func level_up() -> void:
	printerr("level_up method not defined")
