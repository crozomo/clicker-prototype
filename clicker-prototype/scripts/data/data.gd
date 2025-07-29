class_name Data
extends Resource
## Contain data to save and load

## Current amount of stardust available
@export var stardust : int = 0

## Current amount of consciousness core available
@export var consciousness_core : int = 1

## Upgrade 01 current level
@export var up_01_level : int = 0

## Contains CC Upgrades data to save and load
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()
