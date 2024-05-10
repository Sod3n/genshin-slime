extends Control

const info_offset: Vector2 = Vector2(20, 0)

@onready var ctrl_inventory_left := %CtrlInventoryGridLeft

@onready var inventory_grid_left = %InventoryGridLeft
@onready var lbl_info = %LblInfo


func _ready() -> void:
	ctrl_inventory_left.item_mouse_entered.connect(_on_item_mouse_entered)
	ctrl_inventory_left.item_mouse_exited.connect(_on_item_mouse_exited)
	
	InventoryInstance.value = inventory_grid_left
	#ctrl_inventory_right.item_mouse_entered.connect(_on_item_mouse_entered)
	#ctrl_inventory_right.item_mouse_exited.connect(_on_item_mouse_exited)
	#btn_sort_left.pressed.connect(_on_btn_sort.bind(ctrl_inventory_left))
	#btn_sort_right.pressed.connect(_on_btn_sort.bind(ctrl_inventory_right))
	#btn_unequip.pressed.connect(_on_btn_unequip)


func _on_item_mouse_entered(item: InventoryItem) -> void:
	lbl_info.show()
	lbl_info.text = item.prototype_id


func _on_item_mouse_exited(_item: InventoryItem) -> void:
	lbl_info.hide()


	


func _on_btn_sort(ctrl_inventory) -> void:
	if !ctrl_inventory.inventory.sort():
		print("Warning: InventoryGrid.sort() returned false!")


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		if self.visible:
			self.hide()
		else:
			self.show()
			
	if self.visible:
		self.grab_focus()
		self.focus_mode = Control.FOCUS_ALL
	
func _input(event: InputEvent) -> void:
	if !(event is InputEventMouseMotion):
		return

	lbl_info.set_global_position(get_global_mouse_position() + info_offset)


func _on_gui_input(event):
	get_viewport().set_input_as_handled()
	self.accept_event()
	_unhandled_input(event)

