package pallette.nature;

// Provide realistic skin shades?
enum abstract SkinTones( Int ) to Int from Int {
    // Always G>B ?
    var woodBark        = 0xFF2D221E;
    var sambuca         = 0xFF3C2E28;
    var rebel           = 0xFF4B3932;
    var veryDarkBrown   = 0xFF5A453C;
    var spice           = 0xFF695046;
    var dorado          = 0xFF785C50;
    var russett         = 0xFF87675A;
    var toast           = 0xFF967264;
    var hemp            = 0xFFA57E6E;
    var brandyRose      = 0xFFB48A78;
    var quickSand       = 0xFFC39582;
    var rose            = 0xFFD2A18C;
    var tumbleweed      = 0xFFE1AC96;
    var mandysPink      = 0xFFF0B8A0;
    var melon           = 0xFFFFC3AA;
    var apricot         = 0xFFFFCEB4;
    var karry           = 0xFFFFDABE;
    var bisque          = 0xFFFFE5C8;
}
class SkinTone{
    inline public static 
    function getColors (): Array<SkinTones> {
        return  [ woodBark
                , sambuca
                , rebel
                , veryDarkBrown
                , spice
                , dorado
                , russett
                , toast
                , hemp
                , brandyRose
                , quickSand
                , rose
                , tumbleweed
                , mandysPink
                , melon
                , apricot
                , karry
                , bisque ];
    }
    inline public static
    function random(): SkinTones {
        var all = getTones();
        var rnd: Int = Math.round( Math.random()*16);
        return all[rnd];
    }
    inline public static
    function getName( s: SkinShade ): String {
        return switch( s ){
            case woodBark:       'woodBark';
            case sambuca:        'sambuca';
            case rebel:          'rebel';
            case veryDarkBrown:  'veryDarkBrown';
            case spice:          'spice';
            case dorado:         'dorada';
            case russett:        'russett';
            case toast:          'toast';
            case hemp:           'hemp';
            case brandyRose:     'brandyRose';
            case quickSand:      'quickSand';
            case rose:           'rose';
            case tumbleweed:     'tumbleweed';
            case mandysPink:     'mandysPink';
            case melon:          'melon';
            case apricot:        'apricot';
            case karry:          'karry';
            case bisque:         'bisque';
        }
    }
}
