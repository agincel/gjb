/// @description Insert description here
// You can write your code in this editor

message[0] = "7 April.\n\nThe signals came for the first time that day. And we knew right away, that time was limited.\n";
message[1] = "I am a member of the Planetary Defense Alliance. My job is to protect the Earth.\n";
message[2] = "Every night, I worry they arrive before we are capable of fighting back.\n\nThat we -- and I, myself -- will fail in our mission.\n";
message[3] = "The anxiety manifests itself as a recurring dream.\n";
message[4] = "I come to, conscious in my sleep, in the afterlife. Alone.\n\nIn these dreams, I have died.";
message[5] = "I worry one day, it will be real.\n";
message[6] = "And I won't wake up.\n";

message3alt = "The anxiety manifests itself as a recurring\n        nightmare.";

message4alt[0] = "I come to, conscious in my sleep, in the afterlife. Alone.\n\nIn these dreams, I have\n   failed.";
message4alt[1] = "I come to, conscious in my sleep, in the afterlife. Alone.\n\nIn these dreams, I have\n\n         let everyone down.";
message4alt[2] = "I come to, conscious in my sleep, in the afterlife. Alone.\n\nIn these dreams, I have\n\n\n     doomed the\nhuman race.";

message6alt[0] = "And I won't\n          be there.";
message6alt[1] = "And I won't\n\n  make it back.";
message6alt[2] = "And I won't\n\n\n           complete my mission.";

distortion[0] = 0;
distortion[1] = 0;
distortion[2] = 0;
distortion[3] = 0;
distortion[4] = 0;
distortion[5] = 0;

current_message = 0;
pointer = 0;

distortionFrame = true;

glitchSound = -1;
audio_play_sound(snd_ambience, 1, true);

alarm[0] = 120;
alarm[1] = 30;