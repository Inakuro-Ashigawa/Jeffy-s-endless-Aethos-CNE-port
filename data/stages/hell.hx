import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import flixel.util.FlxTimer;
import flixel.FlxG;
var cutscene = null;

var hudTween:FlxTween;
var gameTween:FlxTween;

var path = "stages/underworld/";
var path2 = "stages/underworld/phs2/";

var jeffSpot:Int = 255;
var marvSpot:Int = 285;
var curSpot:Int = 265;

var head:FlxSprite;

function create() {

        cutscene = new FlxVideo();
        cutscene.onEndReached.add(cutscene.dispose);
	cutscene.load(Assets.getPath(Paths.file("videos/jeffscene.mp4")));
	trace(Assets.getPath(Paths.file("videos/jeffscene.mp4")));

    defaultCamZoom = 0.7;
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.1, {ease: FlxEase.quadInOut});
    dad.x = -400;
    gf.x = 500;
    gf.y = 450;
    gf.scrollFactor.set(1,1);
    boyfriend.x = 700;
    boyfriend.y = 150;

    staticd = new FlxSprite(0, -500);
    staticd.frames = Paths.getFrames(path+"statid");
    staticd.animation.addByPrefix("idle", "idle", 24, true);
    staticd.scrollFactor.set(0.6,0.6);
    staticd.scale.set(4,4);
    staticd.animation.play("idle");
    insert(0, staticd);

    hill = new FlxSprite(400).loadGraphic(Paths.image(path+"hill1"));
    hill.scale.set(2.5,2.5);
    hill.scrollFactor.set(1/2,1);
    insert(1, hill);

    hill2 = new FlxSprite(-25, 100).loadGraphic(Paths.image(path+"hill2"));
    hill2.scale.set(2.5,2.5);
    hill2.scrollFactor.set(2/2,1);
    insert(2, hill2);

    axehouse = new FlxSprite(-700, -65);
    axehouse.frames = Paths.getFrames(path+"axehouse");
    axehouse.scale.set(2.5,2.5);
    insert(3, axehouse);

    evil = new FlxSprite(1000, 75).loadGraphic(Paths.image(path+"evilghost"));
    evil.scrollFactor.set(0.5, 1);
    evil.scale.set(0.5,0.5);
    insert(4, evil);

    theHead = new FlxTypedGroup();
    insert(5, theHead);

    eyes = new FlxSprite(curSpot, -555).loadGraphic(Paths.image(path+"eyebal"));
    eyes.scrollFactor.set(1, 1);
    eyes.scale.set(0.7,0.7);
    theHead.add(eyes);

    head = new FlxSprite(200, -600).loadGraphic(Paths.image(path+"loganhedz"), true, 337,438);
    head.animation.add(head, [0,1,2,3,4], 0);
    //head.scrollFactor.set(1, 1);
    head.scale.set(0.7,0.7);
    theHead.add(head);
    
    statir = new FlxSprite(-1000, -300).loadGraphic(Paths.image(path2+"statir"));
    statir.scrollFactor.set(1,1);
    insert(6, statir);

    clouds = new FlxSprite(-1000, -200).loadGraphic(Paths.image(path2+"clouds"));
    clouds.scrollFactor.set(1,1);
    insert(7, clouds);

    backhil = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"backhil"));
    backhil.scrollFactor.set(1,1);
    insert(8, backhil);

    bulk = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"bulk"));
    bulk.scrollFactor.set(1,1);
    insert(9, bulk);

    glow = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"glow"));
    glow.scrollFactor.set(1,1);
    insert(10, glow);

    chop = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"chop"));
    chop.scrollFactor.set(1,1);
    insert(11, chop);

    glow2 = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"glow2"));
    glow2.scrollFactor.set(1,1);
    insert(12, glow2);

    hills = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"hills"));
    hills.scrollFactor.set(1,1);
    insert(13, hills);

    var index = members.indexOf(strumLines.members[2].characters[0]);
    black = new FlxSprite(-500, -500);
    black.makeSolid(FlxG.width * 2.3, FlxG.width * 2.3, 0xFF000000);
    black.scrollFactor.set(0, 0);
    insert(100000000, black); // dont fucking ask - tedyes

   for (i in [statir,clouds,backhil, bulk, glow, chop, glow2, hills]) i.alpha = 0.00000000001;
}
var fullTime:Float = 0;
var canFloat:Bool = false;
function update(elapsed) {	
        fullTime += elapsed;
        evil.alpha = Math.sin(curBeat / 4);
        eyes.x = curSpot;
        eyes.y = head.y + 155;
        if (canFloat) head.y = 0 - (20 * FlxMath.fastSin(fullTime*1.8));
        if (curCameraTarget == 0) curSpot = Math.floor(lerp(curSpot, jeffSpot, 0.2));
        if (curCameraTarget == 1) curSpot = Math.floor(lerp(curSpot, marvSpot, 0.2));
}
function beatHit(curBeat) {	
        if(curBeat % 2 == 0) head.animation.randomFrame();
}

function loganhead(){
        FlxTween.tween(theHead.members[1], {y: 0}, 0.7, {ease: FlxEase.circOut, onComplete: function(twn:FlxTween) {canFloat = true;}});
        for (i in 0...theHead.members.length) FlxTween.tween(theHead.members[i].scale, {x: 1, y: 1}, 0.7, {ease: FlxEase.circOut});       
}

function ss(){
        if(hudTween != null) {
            hudTween.cancel();
        }
        if(gameTween != null) {
            gameTween.cancel();
        }
        FlxG.camera.shake(0.01, 0.05);
        camHUD.zoom += 0.01;
        FlxG.camera.zoom += 0.01;
        hudTween = FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.quadOut});
        gameTween = FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, 0.5, {ease: FlxEase.quadOut});
}

//i swear to god inakuro!!!!! try pressing the tab key once in a while!!!!
//ill do it for you *this* time, but next time....! - Bromaster :3
function diehouse() {
        axehouse.animation.addByPrefix('chop', 'chop', 24, false);	
	axehouse.animation.play("chop");
}
function house2(){
        camGame.followLerp = 0.04;
        camGame.flash(0xFFFF0000,1);
	for (i in [clouds,backhil, bulk, glow, chop, glow2, hills]) i.alpha = 1;
	statir.alpha = .4;
	for (i in [axehouse,hill2, hill,gf]) i.alpha = 0.0000000001;
        evil.destroy();
        theHead.destroy();
	defaultCamZoom = 0.6;
}
function Transition(){
	FlxTween.tween(camHUD, {alpha: 0.000000001}, 1, {ease: FlxEase.sineInOut});
	for (i in [staticd,statir,clouds,backhil, bulk, glow, chop, glow2, hills, boyfriend, dad]) FlxTween.tween(i, {alpha: 0.000000001}, 1, {ease: FlxEase.sineInOut});
        FlxTween.tween(black, {alpha: 1}, 1, {ease: FlxEase.sineInOut});
}
function Transition2(){
	FlxTween.tween(camHUD, {alpha: 1}, 1, {ease: FlxEase.sineInOut});
}
function starting(){
        camGame.followLerp = 0.04;
	FlxTween.tween(black, {alpha: 0}, 5, {ease: FlxEase.sineInOut});
}
function lockin(){
	FlxTween.tween(FlxG.camera, {zoom: 1}, 2.5, {ease: FlxEase.expoIn});
}
function back(){
	for (i in [boyfriend, dad]) i.alpha = 1;
        black.alpha = 0.0000001;
}
//this one is mine!!!! - bromaster
// :3
function cutsc() {
        camGame.flash(0xFFFF0000,0.05);
	cutscene.play(); // :3
	trace("cutscene!!!");
}

function finale() {

}
