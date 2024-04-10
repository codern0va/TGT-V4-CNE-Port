function onPlayerHit(e) {
    if (e.noteType == "Bullet") {
			e.showSplash = true;
			if (!e.note.isSustainNote) {
				e.healthGain -= 0; // Same damage as the og mod
				game.camHUD.shake(0.01, 0.2);
		        game.camGame.shake(0.01, 0.2);
			} else e.healthGain = 0;
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Bullet") {
		e.cancel();
		e.healthGain -= .20;
		deleteNote(e.note); // Deletes the note when it goes offscreen
	}
}

function onDadHit(e)
	if (!e.player && e.noteType == "Bullet")
		e.cancel();


function onNoteCreation(e) {
		switch (e.noteType) {
			case "Bullet":
				/*
				If you're playing as the opponent (PlayState.opponentMode)
				and any strumlines AFTER dad (e.strumLineID >= 1)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals strumlines, as long as it's after dads' strumline it's hittable
				*/
				if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;

				/*
				If you're playing solo (!PlayState.opponentMode)
				and any strumlines BEFORE the current character you're playing (e.strumLineID <= 0)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals, as long as it's BEFORE dad's strumline
				*/
				if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/chapter1/BULLETNOTE_assets";
				e.noteScale = 0.73;
				e.mustHit = true;
				e.note.splash = "Bullet"; // Set the splash
				e.note.updateHitbox();
				e.note.earlyPressWindow = 0.1; // so you wouldn't hit it too early whilst also making it so you wouldn't hit it pixel perfect
				e.note.latePressWindow = 0.2; // Same purpose as above
		}
}