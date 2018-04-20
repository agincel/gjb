/// @description Insert description here
// You can write your code in this editor
if (other.isPossessed && !hasTriggered) {
	time -= 1;
	if (time <= 0) {
		hasTriggered = true;
		event_user(0);
	}
}