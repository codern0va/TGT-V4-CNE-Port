

function onNoteHit(e)
    if (e.noteType == "Bullet")
        e.animSuffix = "dodge";

function onPlayerHit(e) {
    if (e.noteType == "Bullet"){
        dad.playAnim("shoot", true);
        boyfriend.playAnim("dodge", true);
        boyfriend.specialAnim = true;
        dad.specialAnim = true;
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Bullet"){
		deleteNote(e.note);
        health -= .1;
        dad.playAnim("shoot", true);
        boyfriend.playAnim("shot", true);
        boyfriend.specialAnim = true;
        dad.specialAnim = true;
	}
}

function onDadHit(e) {
    if (e.noteType == "Bullet"){
        health += .25;
        dad.playAnim("shoot", true);
    }
}

function onNoteCreation(e) {
    if (e.noteType == "Bullet"){
		e.noteSprite = "game/notes/chapter1/BULLETNOTE_assets";
        e.note.splash = "Bullet";
		e.note.updateHitbox();
	}
}

function postCreate()
    if (hurtTween != null)
        hurtTween.cancel();