import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

var singColor = 0xFFFF4444;
var camlyrics = new FlxCamera();

var lyrics:FlxText;

function create()
{
    camlyrics.bgColor = 0;
    camlyrics.alpha = 1;
    FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camHUD, false);
    FlxG.cameras.add(camlyrics, false);

    lyrics = new FlxText(0,200,1900,'', 28);
    lyrics.screenCenter(FlxAxes.X);
    lyrics.cameras = [camlyrics];
    lyrics.autoSize = false;
    lyrics.borderStyle = FlxTextBorderStyle.OUTLINE;
    lyrics.borderSize = 2;
    lyrics.alignment = 'center';
    lyrics.font = Paths.font('vcr.ttf');
    add(lyrics);
}

function setText(txt:String)
{
    lyrics.text = txt;
}
function noTxt(txt:String)
{
    lyrics.text = '';
}

function setSung(txt:String)
{
    var words = lyrics.text.split(" ");
    var sungWords = txt.split(" ");
    var endString:String = '';

    for(i in 0...words.length)
    {
        if(sungWords[i] == words[i])
        {
            endString += '*'+words[i]+'* ';
        }
            
        else {
            endString += words[i]+' ';
        }
            
    }

    lyrics.applyMarkup(endString,
    [
        new FlxTextFormatMarkerPair(new FlxTextFormat(singColor), "*")
    ]);
}

function setSungEZ(num:String)
{
    var num = Std.int(num);
    var words = lyrics.text.split(" ");
    var string = lyrics.text;
    var endString:String = '';

    for(i in 0...num)
    {
        if(i == 0)
            string = StringTools.replace(string, words[i]+' ', '*'+words[i]+'* ');
        else
            string = StringTools.replace(string, ' '+words[i]+' ', ' *'+words[i]+'* ');
    }

    lyrics.applyMarkup(string,
    [
        new FlxTextFormatMarkerPair(new FlxTextFormat(singColor), "*")
    ]);
}