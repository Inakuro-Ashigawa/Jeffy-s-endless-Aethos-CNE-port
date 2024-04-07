var path = "stages/underworld/";
var path2 = "stages/underworld/phs2/";

function create() {
    defaultCamZoom = 0.7;
    FlxG.camera.followLerp = 0.04;
    dad.x = -400;
    gf.y = 400;
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

    hill = new FlxSprite().loadGraphic(Paths.image(path+"hill1"));
    hill.scale.set(2.5,2.5);
    hill.scrollFactor.set(0.7,0.7);
    insert(1, hill);

    hill2 = new FlxSprite(-20, 100).loadGraphic(Paths.image(path+"hill2"));
    hill2.scale.set(2.5,2.5);
    insert(2, hill2);

    axehouse = new FlxSprite(-700, -75);
    axehouse.frames = Paths.getFrames(path+"axehouse");
    axehouse.animation.addByPrefix("idle", "chop", 24,false);
    axehouse.scale.set(2.5,2.5);
    insert(3, axehouse);

    statir = new FlxSprite(-1000, -300).loadGraphic(Paths.image(path2+"statir"));
    statir.scrollFactor.set(1,1);
    insert(4, statir);

    clouds = new FlxSprite(-1000, -200).loadGraphic(Paths.image(path2+"clouds"));
    clouds.scrollFactor.set(1,1);
    insert(5, clouds);

    backhil = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"backhil"));
    backhil.scrollFactor.set(1,1);
    insert(6, backhil);

    bulk = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"bulk"));
    bulk.scrollFactor.set(1,1);
    insert(7, bulk);

    glow = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"glow"));
    glow.scrollFactor.set(1,1);
    insert(8, glow);

    chop = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"chop"));
    chop.scrollFactor.set(1,1);
    insert(9, chop);

    glow2 = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"glow2"));
    glow2.scrollFactor.set(1,1);
    insert(10, glow2);

    hills = new FlxSprite(-900,-200).loadGraphic(Paths.image(path2+"hills"));
    hills.scrollFactor.set(1,1);
    insert(11, hills);

   for (i in [statir,clouds,backhil, bulk, glow, chop, glow2, hills]) i.alpha = 0.00000000001;

}

function chop() {	
   axehouse.animation.play("idle");
}
function house2(){
   for (i in [clouds,backhil, bulk, glow, chop, glow2, hills]) i.alpha = 1;
   statir.alpha = .4;
   for (i in [axehouse,hill2, hill,gf]) i.alpha = 0.0000000001;
   defaultCamZoom = 0.6;
}
function Transition(){
  FlxTween.tween(camGame, {alpha: 0.000000001}, 1, {ease: FlxEase.sineInOut});
  FlxTween.tween(camHUD, {alpha: 0.000000001}, 1, {ease: FlxEase.sineInOut});
}
function Transition(){
  FlxTween.tween(camGame, {alpha: 0.000000001}, 1, {ease: FlxEase.sineInOut});
  FlxTween.tween(camHUD, {alpha: 1}, 1, {ease: FlxEase.sineInOut});
}
