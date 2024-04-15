var offX:Float = -1000/2;
var offY:Float = -500/2;

function create(){
    var back = new FlxSprite(offX + 200, offY + 25);
	back.loadGraphic(Paths.image("stages/chapter1/stage3/back"));	
	back.scrollFactor.set(0.75, 0.75);
	insert(members.indexOf(gf), back);
	add(back);
		
	var mback = back.clone();
	mback.setPosition(back.x - 2876, back.y);
	mback.scrollFactor.set(0.75, 0.75);
	mback.flipX = true;
	insert(members.indexOf(gf), mback);
	add(mback);
		
	mback = back.clone();
	mback.setPosition(back.x + 2876, back.y);
	mback.scrollFactor.set(0.75, 0.75);
	mback.flipX = true;
	insert(members.indexOf(gf), mback);
	add(mback);

	////
	var ground = new FlxSprite(offX, offY + 741);
	ground.loadGraphic(Paths.image("stages/chapter1/stage3/ground"));	
	ground.scrollFactor.set(1, 0.95);
	insert(members.indexOf(gf), ground);
	add(ground);
	
	var mground = ground.clone();
	mground.setPosition(offX - 2876, offY + 741);
	mground.scrollFactor.set(1, 0.95);
	mground.flipX = true;
	insert(members.indexOf(gf), mground);
	add(mground);
	
	mground = ground.clone();
	mground.setPosition(offX + 2876, offY + 741);
	mground.scrollFactor.set(1, 0.95);
	mground.flipX = true;
	insert(members.indexOf(gf), mground);
	add(mground);
	
	tails = new Character(640, 610, "db-tails");
	tails.scrollFactor.set(0.95, 0.95);
	insert(members.indexOf(gf), tails);
	add(tails);
		
	knux = new Character(1680, 630, "db-knuckles");
	knux.scrollFactor.set(0.95, 0.95);
	insert(members.indexOf(gf), knux);
	add(knux);

	function onPlayerHit(e) {
		if (e.noteType == "Bullet"){
			tails.playAnim("knuckles bg shoot", true);
			knux.playAnim("knuckles bg shoot", true);
		}
	}
}