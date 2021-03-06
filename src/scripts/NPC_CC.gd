extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

# Essa função valida se a interação com o NPC está ocorrendo e caso ocorra mostra o diálogo
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_select") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-CC')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

# Quando o persongame "character" entra na área do NPC a função é ativada
func _on_NPC_body_entered(body):
		if body.name == 'character':
			active = true

func unpause(_timeline_name):
	get_tree().paused = false

# Quando o persongame "character" sai da área do NPC a função é desativada
func _on_NPC_body_exited(body):
	if body.name == 'character':
		active = false
