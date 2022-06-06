package pallette.ansi;

final begin = '\033[';
final end   = '\033[0m';
final fore  = '38;5;';
final back  = '48;5;';
#if sys
function println( txt: String ){
    Sys.println('$begin$txt$end');
}
function fontColor( txt: String, foreIndex: Int, ?backIndex: Int = -1 ){
    var foreColor = txColor( foreIndex );
    return if( backIndex == -1 ){
        '${foreColor}m$txt';
    } else {
        var backColor = bgColor( backIndex );
        '$foreColor;${backColor}m$txt';
    }
}
function txColor( colorIndex: Int ){
    var color = Std.string( colorIndex );
    return '$fore$color';
}
function bgColor( colorIndex: Int ){
    var color = Std.string( colorIndex );
    return '$back$color';
}
#end
