extends Button

# Apertando o botão ocorre mudança de cena
func _on_Button_pressed():
	var _changeScene = get_tree().change_scene('res://scenes/minigame_ciencia_computacao.tscn')
