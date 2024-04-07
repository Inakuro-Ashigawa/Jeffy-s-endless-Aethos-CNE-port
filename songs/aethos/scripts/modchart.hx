//yasher did mainly everything
//bromaster(me!!! hi :3) made it multikey compatible for his script
var defaultNotePosX = [
    96,
    208,
    320,
    432
];

var defaultNotePosY = 50; 

var shaking:Bool = false;
var q:Int = 2;

function onPostNoteCreation(event) {
    var note = event.note;
    note.splash = "Jeffyblood";
}

function postCreate() {
        for (i in 0...cpuStrums.members.length) {
		defaultNotePosX[i] = cpuStrums.members[i].x;
		trace(defaultNotePosX[i]);
	}
}

function update(elapsed:Float) {
    var songPos = Conductor.songPosition;
    var currentBeat = (songPos / 1000) * (PlayState.SONG.meta.bpm / 60);

    if (shaking) {
        for (i in 0...cpuStrums.members.length) {
            cpuStrums.members[i].x = defaultNotePosX[i] + FlxG.random.int(-q, q) + Math.sin((currentBeat + i * 0.25) * Math.PI);
            cpuStrums.members[i].y = defaultNotePosY + FlxG.random.int(-q, q) + Math.sin((currentBeat + i * 0.25) * Math.PI);
        }
    }
}

function stepHit(curBeat) {
    switch (curBeat) {
        case -19:
            shaking = true;
        case 3300:
            shaking = false;
    }
}