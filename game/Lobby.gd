extends Node2D

func _ready():
  get_tree().connect("network_peer_connected", self, "_player_connected")

func _player_connected(id):
  print("Player connected to server!")
  #Game on!
  globals.otherPlayerId = id
  var game = preload("res://World.tscn").instance()
  get_tree().get_root().add_child(game)
  hide()

func _on_Host_pressed():
  print("Hosting network")
  var new_host = NetworkedMultiplayerENet.new()
  var res = new_host.create_server(4242,2)
  if res != OK:
    print("Error creating server")
    return

  $Join.hide()
  $Host.disabled = true
  get_tree().set_network_peer(new_host)


func _on_Join_pressed():
  print("Joining network")
  var new_host = NetworkedMultiplayerENet.new()
  new_host.create_client("127.0.0.1",4242)
  get_tree().set_network_peer(new_host)
  $Host.hide()
  $Join.disabled = true