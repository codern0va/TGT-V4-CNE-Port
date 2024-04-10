var offX:Float = -1000/2;
var offY:Float = -500/2;

function create(){
    var graphic = Paths.image("stages/stage1/ground");
	
	var ground = new FlxSprite(offX, offY + 710);
	ground.loadGraphic(graphic);	
	ground.scrollFactor.set(1, 0.95);
    insert(members.indexOf(gf), ground);
	
	var rground = new FlxSprite(ground.x + ground.width, ground.y);
	rground.loadGraphic(graphic);	
	rground.scrollFactor.set(1, 0.95);
	rground.flipX = true;
    insert(members.indexOf(gf), rground);
	
	var lground = new FlxSprite(ground.x - ground.width, ground.y);
	lground.loadGraphic(graphic);	
	lground.scrollFactor.set(1, 0.95);
	lground.flipX = true;
    insert(members.indexOf(gf), lground);
	
	var groundFiller = new FlxSprite(lground.x, ground.y + ground.height - 10);
	groundFiller.makeGraphic(1, 1, 0xFF23B14D);
	groundFiller.scale.set(ground.width*3, FlxG.height);
	groundFiller.updateHitbox();
	groundFiller.scrollFactor.set(1, 0.95);
	groundFiller.antialiasing = false;
    insert(members.indexOf(gf), groundFiller);
	
	add(groundFiller);
	add(lground);
	add(rground);
	add(ground);
}