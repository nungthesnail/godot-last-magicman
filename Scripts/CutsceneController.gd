extends Node
class_name Cutscene_Controller

#-Interface variables-
export (NodePath) var camera_anchor
export (NodePath) var animation_player
var IsActive : bool = false

#--Private variables--
var _timer : Timer
var _label : Label
var CamAnchor = null
var Anim = null
#---------------------

#-Interface functions-

func TakeText(text : String):
	if not _timer or not _label: return
	if not _timer.is_stopped(): _timer.stop()
	
	_timer.wait_time = (len(text) * 0.2)
	_label.text = text
	_timer.start()
	

func SetActive(value : bool):
	IsActive = value
	if IsActive == true and G.csObject != self:
		G.csObject = self
	

#---Inner functions---
func _ready():
	if get_node_or_null(camera_anchor):
		CamAnchor = get_node(camera_anchor)
	
	if get_node_or_null(animation_player):
		Anim = get_node(animation_player)
	
	_timer = Timer.new(); _timer.name = "timer";
	_label = G.Gui ["csLabel"]
	add_child(_timer)
	
	_timer.one_shot = true
	

func _process(delta):
	if _label == null: _label = G.Gui ["csLabel"]
	
	if _timer and _label:
		if _timer.is_stopped() and _label.text != "":
			_label.text = ""
		
	
	



