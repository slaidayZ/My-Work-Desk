extends CharacterBody2D

const SPEED = 200 # скорость персонажа

var velocit = Vector2.ZERO # вектор скорости персонажа
func _process(delta):
	$FieldOfView.look_at(get_global_mouse_position())
	$FieldOfView.rotation_degrees -= 45
	$SecondView.look_at(get_global_mouse_position())

func _physics_process(delta):
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
		$Sprite.flip_h = false
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
		$Sprite.flip_h = true
	if Input.is_action_pressed("Up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("Down"):
		velocity.y += SPEED
	velocity = velocity.normalized() * SPEED
	move_and_slide()
	
func _on_Player_body_entered(body):
	if body.class == "wall":
		emit_signal("WallCollide")
