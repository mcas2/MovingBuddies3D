extends CharacterBody3D

@onready var selection_marker:MeshInstance3D = $SelectionMarker
@onready var area_clickable:Area3D = $PlayerClickableArea

func _ready() -> void:
	add_to_group("player")
	selection_marker.visible = false
	area_clickable.connect("mouse_entered", self._on_area_mouse_entered)
	area_clickable.connect("mouse_exited", self._on_area_mouse_exited)

var _mouse_over := false

func _process(delta: float) -> void:
	if _mouse_over and Input.is_action_just_pressed("select_unit"):
		print("Click")
		set_selection(true)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_area_mouse_entered() -> void:
	_mouse_over = true
	print("SI")

func _on_area_mouse_exited() -> void:
	_mouse_over = false
	print("NO")
	
func set_selection(seleccionado: bool):
	if selection_marker.visible == seleccionado:
		return
	selection_marker.visible = seleccionado
