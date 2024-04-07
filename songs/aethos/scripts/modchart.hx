var defaultNotePos = [
    [96, 50],
    [208, 50],
    [320, 50],
    [432, 50],
];

var shaking:Bool = false;
var q:Int = 2;

function onPostNoteCreation(event) {
    var note = event.note;
    note.splash = "Jeffyblood";
}

function update(elapsed:Float) {
    var songPos = Conductor.songPosition;
    var currentBeat = (songPos / 1000) * (PlayState.SONG.meta.bpm / 60);

    if (shaking) {
        for (i in 0...4) {
            cpuStrums.members[i].x = defaultNotePos[i][0] + FlxG.random.int(-q, q) + Math.sin((currentBeat + i * 0.25) * Math.PI);
            cpuStrums.members[i].y = defaultNotePos[i][1] + FlxG.random.int(-q, q) + Math.sin((currentBeat + i * 0.25) * Math.PI);
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