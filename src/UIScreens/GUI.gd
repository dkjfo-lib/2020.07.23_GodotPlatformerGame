# 'onready' used to get nodes before start of the scene to save CPU power 
# self.my_class_property will call seter geter (setget functions)
# scene_tree.set_input_as_handled() stops all '_unhandled_input' triggers within scene tree
# 'pause = process' property allows node and it's children to be actie within paused parent

# func _ready() -> void:
#	PlayerData.connect("score_updated", self, "on_score_changed")

# score_label.text = score_label.text % [PlayerData.score, PlayerData.death_count]
# score_label.text = score_label.text % PlayerData.score


extends Control

# 'onready' used to get nodes before start of the scene to save CPU power 
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score_label: Label = $Label
onready var menu_title: Label = $PauseOverlay/header

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "on_score_changed")
	PlayerData.connect("player_died",self, "on_player_died")
	update_interface()

func on_score_changed(value: int) -> void: 
	update_interface()

func on_player_died(value: int) -> void: 
	set_paused(true) 
	menu_title.text = "YOU DIED"

func update_interface() -> void:
	score_label.text = "score: %s" % PlayerData.score

# self.my_class_property will call seter g ter (setget functions)
# scene_tree.set_input_as_handled() stops all '_unhandled_input' triggers within scene tree
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
