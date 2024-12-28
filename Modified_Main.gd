
extends Node
class_name Main

signal upnp_completed(error : Object)

const PLAYER : PackedScene = preload("res://data/scene/character/RigidPlayer.tscn")
const CAMERA : PackedScene = preload("res://data/scene/camera/Camera.tscn")
const PORT = 30815
const SERVER_INFO_PORT = 30816

var udp_server : UDPServer = UDPServer.new()
var thread : Thread = null
var upnp : UPNP = null
var host_public := true
var upnp_err : int = -1
var enet_peer := ENetMultiplayerPeer.new()
var lan_advertiser : ServerAdvertiser = null
var lan_listener : ServerListener = ServerListener.new()
var lan_entries := []

# Create and add a login button
func _ready():
    var login_button = Button.new()
    login_button.text = "Login"
    login_button.rect_min_size = Vector2(150, 50) # Set size
    login_button.set_position(Vector2(300, 200)) # Position on screen
    login_button.connect("pressed", self, "_on_login_button_pressed") # Connect signal
    add_child(login_button) # Add to scene

# Callback for button press
func _on_login_button_pressed():
    print("Login button pressed!") # Placeholder for future login logic
