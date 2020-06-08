package pallette.nature;

enum abstract SkinTones2( Int ) to Int from Int {
    var caramel =       0xFFFFDCB1;
    var gold =          0xFFE5C29B;
    var goldSand =      0xFFE4B98E;
    var calico =        0xFFE2B98F;
    var copper =        0xFFE3A173;
    var copperField =   0xFFD99164;
    var rawSienna =     0xFFCC8443;
    var antiqueBrass =  0xFFC77A58;
    var fire =          0xFFA54900;
    var redBerry =      0xFF880400;
    var loneStar =      0xFF710200;
    var brownPod =      0xFF440C00;
    var negroni =       0xFFFFE0C4;
    var desertSand =    0xFFEECFB4;
    var tumbleWeed =    0xFFDEAB7F;
    var tumbleWeed2 =   0xFFE0B184;
    var tumbleWeed3 =   0xFFDFA675;
    var copper2 =       0xFFBE723C;
    var brightRed =     0xFFA01900;
    var rosewood =      0xFF580000;
    var black =         0xFF000000;
    var parchment =     0xFFEDE4C8;
    var desertSand2 =   0xFFEFD6BD;
    var gold2 =         0xFFEABD9D;
    var roseFog =       0xFFE3C2AE;
    var calico2 =       0xFFDFB997;
    var wiskey =        0xFFD0926E;
    var mongoose =      0xFFBD9778;
    var brown =         0xFFBB6D4A;
    var redBerry2 =     0xFF940A00;
    var roseFog2 =      0xFFE1ADA4;
    var barleyCorn =    0xFFA58859;
    var maroon =        0xFF7B0000;
    var loneStar2 =     0xFF720000;
    var rosewood2 =     0xFF560000;
}
/** 
   ![skinTone2](../../bootstrap/img/skinTone2.png)
**/
class SkinTone2{
    inline public static 
    function getColors (): Array<SkinTones2> {
        return  [   caramel
                  , gold
                  , goldSand
                  , calico
                  , copper
                  , copperField
                  , rawSienna
                  , antiqueBrass
                  , fire
                  , redBerry
                  , loneStar
                  , brownPod
                  , negroni
                  , desertSand
                  , tumbleWeed
                  , tumbleWeed2
                  , tumbleWeed3
                  , copper2
                  , brightRed
                  , rosewood
                  , black
                  , parchment
                  , desertSand2
                  , gold2
                  , roseFog
                  , calico2
                  , wiskey
                  , mongoose
                  , brown
                  , redBerry2
                  , roseFog2
                  , barleyCorn
                  , maroon
                  , loneStar2
                  , rosewood2 ];
    }
    inline public static
    function random(): SkinTones2 {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*34);
        return all[rnd];
    }
    inline public static
    function getName( s: SkinTones2 ): String {
        return switch( s ){
                case caramel:       'caramel';
                case gold:          'gold';
                case goldSand:      'goldSand';
                case calico:        'calico';
                case copper:        'copper';
                case copperField:   'copperField';
                case rawSienna:     'rawSienna';
                case antiqueBrass:  'antiqueBrass';
                case fire:          'fire';
                case redBerry:      'redBerry';
                case loneStar:      'loneStar';
                case brownPod:      'brownPod';
                case negroni:       'negroni';
                case desertSand:    'desertSand';
                case tumbleWeed:    'tumbelWeed';
                case tumbleWeed2:   'tumbleWeed2';
                case tumbleWeed3:   'tumbleWeed3';
                case copper2:       'copper2';
                case brightRed:     'brightRed';
                case rosewood:      'rosewood';
                case black:         'black';
                case parchment:     'parchment';
                case desertSand2:   'desertSand2';
                case gold2:         'gold2';
                case roseFog:       'roseFog';
                case calico2:       'calico2';
                case wiskey:        'wiskey';
                case mongoose:      'mongoose';
                case brown:         'brown';
                case redBerry2:     'redBerry2';
                case roseFog2:      'roseFog2';
                case barleyCorn:    'barleyCorn';
                case maroon:        'maroon';
                case loneStar2:     'loneStar2';
                case rosewood2:     'rosewood2';
        }
    }
}