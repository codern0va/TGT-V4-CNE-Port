var camTitle:HudCamera; //incase you want to do something
var coolSongText:FlxText;
var coolBorderThing:FlxSprite;
var coolBorderThing2:FlxSprite;
var JSON;
var foundFile;
function getTweenEaseByString(?ease:String = '') {
    switch(ease.toLowerCase()) {
        case 'backin': return FlxEase.backIn;
        case 'backinout': return FlxEase.backInOut;
        case 'backout': return FlxEase.backOut;
        case 'bouncein': return FlxEase.bounceIn;
        case 'bounceinout': return FlxEase.bounceInOut;
        case 'bounceout': return FlxEase.bounceOut;
        case 'circin': return FlxEase.circIn;
        case 'circinout': return FlxEase.circInOut;
        case 'circout': return FlxEase.circOut;
        case 'cubein': return FlxEase.cubeIn;
        case 'cubeinout': return FlxEase.cubeInOut;
        case 'cubeout': return FlxEase.cubeOut;
        case 'elasticin': return FlxEase.elasticIn;
        case 'elasticinout': return FlxEase.elasticInOut;
        case 'elasticout': return FlxEase.elasticOut;
        case 'expoin': return FlxEase.expoIn;
        case 'expoinout': return FlxEase.expoInOut;
        case 'expoout': return FlxEase.expoOut;
        case 'quadin': return FlxEase.quadIn;
        case 'quadinout': return FlxEase.quadInOut;
        case 'quadout': return FlxEase.quadOut;
        case 'quartin': return FlxEase.quartIn;
        case 'quartinout': return FlxEase.quartInOut;
        case 'quartout': return FlxEase.quartOut;
        case 'quintin': return FlxEase.quintIn;
        case 'quintinout': return FlxEase.quintInOut;
        case 'quintout': return FlxEase.quintOut;
        case 'sinein': return FlxEase.sineIn;
        case 'sineinout': return FlxEase.sineInOut;
        case 'sineout': return FlxEase.sineOut;
        case 'smoothstepin': return FlxEase.smoothStepIn;
        case 'smoothstepinout': return FlxEase.smoothStepInOut;
        case 'smoothstepout': return FlxEase.smoothStepInOut;
        case 'smootherstepin': return FlxEase.smootherStepIn;
        case 'smootherstepinout': return FlxEase.smootherStepInOut;
        case 'smootherstepout': return FlxEase.smootherStepOut;
    }
    return FlxEase.linear;
}
function create() {
    var path = Paths.file('songs/' + PlayState.SONG.meta.name + '/data.json');
    if (Assets.exists(path)){
        foundFile = true;
        JSON = Json.parse(Assets.getText(path));
    }else{
        foundFile = false;
        trace("Couldn't find the file.");
    }
}
function postCreate(){
    if(foundFile){
        FlxG.cameras.add(camTitle = new HudCamera(), false);
        camTitle.bgColor = '#00000000';
        coolBorderThing = new FlxSprite(-500,285).makeGraphic(500,150,FlxColor.BLACK);
        coolBorderThing2 = new FlxSprite(-50,285).makeGraphic(50,150,FlxColor.fromString(JSON.borderColor));
        coolSongText = new FlxText(-500,288,490,JSON.songName,JSON.songSize);
        coolSongText.setFormat(Paths.font("vcr.ttf"),JSON.songSize,FlxColor.WHITE,"center","outline",FlxColor.BLACK);
        coolSongText.borderQuality = 2;
        coolSongText.borderSize = 2;
        add(coolBorderThing);
        add(coolBorderThing2);
        add(coolSongText);
        coolBorderThing2.camera = camTitle;
        coolBorderThing.camera = camTitle;
        coolSongText.camera = camTitle;
    }
}
function onSongStart() {
    if(foundFile){
        FlxTween.tween(coolSongText, {x: 0}, JSON.duration, {ease: getTweenEaseByString(JSON.ease1)});
        FlxTween.tween(coolBorderThing, {x: 0}, JSON.duration, {ease: getTweenEaseByString(JSON.ease1)});
        FlxTween.tween(coolBorderThing2, {x: 454}, JSON.duration, {ease: getTweenEaseByString(JSON.ease1)});

        FlxTween.tween(coolSongText, {x: -500}, JSON.duration, {ease: getTweenEaseByString(JSON.ease2), startDelay: JSON.delay});
        FlxTween.tween(coolBorderThing, {x: -500}, JSON.duration, {ease: getTweenEaseByString(JSON.ease2), startDelay: JSON.delay});
        FlxTween.tween(coolBorderThing2, {x: -50}, JSON.duration, {ease: getTweenEaseByString(JSON.ease2), startDelay: JSON.delay});
    }
}