class_name State extends Node

@onready var player: CharacterBody2D

var state_machine: StateMachine
var state_path: String
var condition_path: String

func enter() -> void: pass
func update(delta: float) -> void: pass
func exit() -> void: pass
