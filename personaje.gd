extends CharacterBody3D

@onready var selection_marker:MeshInstance3D = $SelectionMarker
@onready var area_clickable:Area3D = $PlayerClickableArea
@onready var area_collision:CollisionShape3D = $PlayerCollision

func _ready() -> void:
	add_to_group("player")
	selection_marker.visible = false
	$Skeleton_Mage/AnimationPlayer.play("Rig_Medium_General/Idle_A")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	
func on_clicked():
	set_selection(true)
	print("Dentro")
	
func unclicked():
	set_selection(false)
	print("Fuera")

func set_selection(seleccionado: bool):
	print(seleccionado)
	if selection_marker.visible == seleccionado:
		return
	selection_marker.visible = seleccionado
