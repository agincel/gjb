soulStart = -1;
soulLoop = -1;
soulStartPossessed = -1;
soulLoopPossessed = -1;
soulImpact = -1;

startedAiming = false;
startedAimingPossessed = false;

aiming = false;
aimingPossessed = false;

stoppedAiming = false;
stoppedAimingPossessed = false;

impactWall = false;
impactPossessible = false;
impactNothing = false;
death = false;

bgm = audio_play_sound(snd_bgm_afterlife, 0, true);
audio_sound_set_track_position(bgm, 0);