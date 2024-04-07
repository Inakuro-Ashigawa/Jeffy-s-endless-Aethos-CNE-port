var path = "stages/underworld/";
var path2 = "stages/underworld/phs2/";

function create() {
    defaultCamZoom = 0.7;
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
    axehouse.animation.addByPrefix("idle", "chop", 24);
    axehouse.scale.set(2.5,2.5);
    insert(3, axehouse);
}