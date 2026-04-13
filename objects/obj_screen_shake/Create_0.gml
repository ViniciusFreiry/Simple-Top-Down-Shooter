shake = 0;

set_shake = function(_shake) {
	if(_shake < shake) return;
	shake = _shake;
}

shake_screen = function() {
	view_xport[0] = random_range(-shake, shake);
	view_yport[0] = random_range(-shake, shake);
	
	if(shake > 0) {
		shake--;
	} else {
		shake = 0;
	}
}