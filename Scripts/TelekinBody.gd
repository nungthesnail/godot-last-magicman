extends RigidBody
class_name TelekinezBody

#-Interface variables-
export (String, "position","rotation") var falling_mode

export (NodePath) var player
export (NodePath) var point_free
export (bool) var is_active
export (bool) var active_rigid

#--Private variables--
var DefaultTransform : Transform
var AppliedForce : float = 0.0
var Difference : float = 0.0
#---------------------

#-Interface functions-
func SendForce(force : float):
	AppliedForce = force

#---Inner functions---
func _init():
	sleeping = true if(active_rigid == false) else false
	if falling_mode == "": falling_mode = "position"

func _ready():
	DefaultTransform = global_transform

func _process(delta):
	sleeping = true if(active_rigid == false) else false
	if is_active == false: global_transform = DefaultTransform
	
	

func _physics_process(delta):
	Difference = AppliedForce - (mass / 100)
	
	if not (get_node_or_null(player) and get_node_or_null(is_active) and get_node_or_null(point_free)): return
	if falling_mode == "position":
		if Difference < 0:
			global_transform.origin = lerp(global_transform.origin,player.global_transform.origin,(-Difference))
		elif Difference == 0:
			global_transform.origin = global_transform.origin
		elif Difference > 0:
			global_transform.origin = lerp(global_transform.origin,point_free.global_transform.origin,(Difference))
		
	elif falling_mode == "rotation":
		if Difference < 0:
			pass
		elif Difference == 0:
			pass
		elif Difference > 0:
			pass
		
	

