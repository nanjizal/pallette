package pallette.general;
import pallette.utils.ColorHelper;
class BrowserColourARGB {
    /**
     * provides a list of closest colours
     */
    inline public static
    function closeColorsByName( col: Int, numberToShow: Int ): Array<String>{
        var all: Array<Int> = getColors();
        var sorted = colorDistanceArr( col, all );
        var out = [];
        for( i in 0...numberToShow ){
            out[ i ] = getName( sorted[ i ] );
        }
        return out;
    }
    /**
     * list of all enums
     */
    inline public static 
    function getColors (): Array<ARGBColours> {
        return  [ AliceBlue
            , AntiqueWhite
//            , Aqua
            , Aquamarine
            , Azure
            , Beige
            , Bisque
            , Black
            , BlanchedAlmond
            , Blue
            , BlueViolet
            , Brown
            , BurlyWood
            , CadetBlue
            , Chartreuse
            , Chocolate
            , Coral
            , CornflowerBlue
            , Cornsilk
            , Crimson
            , Cyan
            , DarkBlue
            , DarkCyan
            , DarkGoldenRod
//            , DarkGray
            , DarkGrey
            , DarkGreen
            , DarkKhaki
            , DarkMagenta
            , DarkOliveGreen
            , Darkorange
            , DarkOrchid
            , DarkRed
            , DarkSalmon
            , DarkSeaGreen
            , DarkSlateBlue
//            , DarkSlateGray
            , DarkSlateGrey
            , DarkTurquoise
            , DarkViolet
            , DeepPink
            , DeepSkyBlue
//            , DimGray
            , DimGrey
            , DodgerBlue
            , FireBrick
            , FloralWhite
            , ForestGreen
//            , Fuchsia
            , Gainsboro
            , GhostWhite
            , Gold
            , GoldenRod
//            , Gray
            , Grey
            , Green
            , GreenYellow
            , HoneyDew
            , HotPink
            , IndianRed
            , Indigo
            , Ivory
            , Khaki
            , Lavender
            , LavenderBlush
            , LawnGreen
            , LemonChiffon
            , LightBlue
            , LightCoral
            , LightCyan
            , LightGoldenRodYellow
//            , LightGray
            , LightGrey
            , LightGreen
            , LightPink
            , LightSalmon
            , LightSeaGreen
            , LightSkyBlue
//            , LightSlateGray
            , LightSlateGrey
            , LightSteelBlue
            , LightYellow
            , Lime
            , LimeGreen
            , Linen
            , Magenta
            , Maroon
            , MediumAquaMarine
            , MediumBlue
            , MediumOrchid
            , MediumPurple
            , MediumSeaGreen
            , MediumSlateBlue
            , MediumSpringGreen
            , MediumTurquoise
            , MediumVioletRed
            , MidnightBlue
            , MintCream
            , MistyRose
            , Moccasin
            , NavajoWhite
            , Navy
            , OldLace
            , Olive
            , OliveDrab
            , Orange
            , OrangeRed
            , Orchid
            , PaleGoldenRod
            , PaleGreen
            , PaleTurquoise
            , PaleVioletRed
            , PapayaWhip
            , PeachPuff
            , Peru
            , Pink
            , Plum
            , PowderBlue
            , Purple
            , Red
            , RosyBrown
            , RoyalBlue
            , SaddleBrown
            , Salmon
            , SandyBrown
            , SeaGreen
            , SeaShell
            , Sienna
            , Silver
            , SkyBlue
            , SlateBlue
//            , SlateGray
            , SlateGrey
            , Snow
            , SpringGreen
            , SteelBlue
            , Tan
            , Teal
            , Thistle
            , Tomato
            , Turquoise
            , Violet
            , Wheat
            , White
            , WhiteSmoke
            , Yellow
            , YellowGreen ];
    }
    /**
     * provides a random way to get a colour
     */
    inline public static
    function random(): ARGBColours {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*(all.length+1));
        return all[rnd];
    }
    /**
     * allows you to query the enums
     */
    inline public static
    function getName( c: ARGBColours ): String {
        return switch( c ){
            case AliceBlue:            'AliceBlue';
            case AntiqueWhite:         'AntiqueWhite';
//            case Aqua:                 'Aqua';
            case Aquamarine:           'Aquamarine';
            case Azure:                'Azure';
            case Beige:                'Beige';
            case Bisque:               'Bisque';
            case Black:                'Black';
            case BlanchedAlmond:       'BlanchedAlmond';
            case Blue:                 'Blue';
            case BlueViolet:           'BlueViolet';
            case Brown:                'Brown';
            case BurlyWood:            'BurlyWood';
            case CadetBlue:            'CadetBlue';
            case Chartreuse:           'Chartreuse';
            case Chocolate:            'Chocolate';
            case Coral:                'Coral';
            case CornflowerBlue:       'CornflowerBlue';
            case Cornsilk:             'Cornsilk';
            case Crimson:              'Crimson';
            case Cyan:                 'Cyan';
            case DarkBlue:             'DarkBlue';
            case DarkCyan:             'DarkCyan';
            case DarkGoldenRod:        'DarkGoldenRod';
//            case DarkGray:             'DarkGray';
            case DarkGrey:             'DarkGrey';
            case DarkGreen:            'DarkGreen';
            case DarkKhaki:            'DarkKhaki';
            case DarkMagenta:          'DarkMagenta';
            case DarkOliveGreen:       'DarkOliveGreen';
            case Darkorange:           'Darkorange';
            case DarkOrchid:           'DarkOrchid';
            case DarkRed:              'DarkRed';
            case DarkSalmon:           'DarkSalmon';
            case DarkSeaGreen:         'DarkSeaGreen';
            case DarkSlateBlue:        'DarkSlateBlue';
//            case DarkSlateGray:        'DarkSlateGray';
            case DarkSlateGrey:        'DarkSlateGrey';
            case DarkTurquoise:        'DarkTurquoise';
            case DarkViolet:           'DarkViolet';
            case DeepPink:             'DeepPink';
            case DeepSkyBlue:          'DeepSkyBlue';
//            case DimGray:              'DimGray';
            case DimGrey:              'DimGrey';
            case DodgerBlue:           'DodgerBlue';
            case FireBrick:            'FireBrick';
            case FloralWhite:          'FloralWhite';
            case ForestGreen:          'ForestGreen';
//            case Fuchsia:              'Fuchsia';
            case Gainsboro:            'Gainsboro';
            case GhostWhite:           'GhostWhite';
            case Gold:                 'Gold';
            case GoldenRod:            'GoldenRod';
//            case Gray:                 'Gray';
            case Grey:                 'Grey';
            case Green:                'Green';
            case GreenYellow:          'GreenYellow';
            case HoneyDew:             'HoneyDew';
            case HotPink:              'HotPink';
            case IndianRed:            'IndianRed';
            case Indigo:               'Indigo';
            case Ivory:                'Ivory';
            case Khaki:                'Khaki';
            case Lavender:             'Lavender';
            case LavenderBlush:        'LavenderBlush';
            case LawnGreen:            'LawnGreen';
            case LemonChiffon:         'LemonChiffon';
            case LightBlue:            'LightBlue';
            case LightCoral:           'LightCoral';
            case LightCyan:            'LightCyan';
            case LightGoldenRodYellow: 'LightGoldenRodYellow';
//            case LightGray:            'LightGray';
            case LightGrey:            'LightGrey';
            case LightGreen:           'LightGreen';
            case LightPink:            'LightPink';
            case LightSalmon:          'LightSalmon';
            case LightSeaGreen:        'LightSeaGreen';
            case LightSkyBlue:         'LightSkyBlue';
//            case LightSlateGray:       'LightSlateGray';
            case LightSlateGrey:       'LightSlateGrey';
            case LightSteelBlue:       'LightSteelBlue';
            case LightYellow:          'LightYellow';
            case Lime:                 'Lime';
            case LimeGreen:            'LimeGreen';
            case Linen:                'Linen';
            case Magenta:              'Magenta';
            case Maroon:               'Maroon';
            case MediumAquaMarine:     'MediumAquaMarine';
            case MediumBlue:           'MediumBlue';
            case MediumOrchid:         'MediumOrchid';
            case MediumPurple:         'MediumPurple';
            case MediumSeaGreen:       'MediumSeaGreen';
            case MediumSlateBlue:      'MediumSlateBlue';
            case MediumSpringGreen:    'MediumSpringGreen';
            case MediumTurquoise:      'MediumTurquoise';
            case MediumVioletRed:      'MediumVioletRed';
            case MidnightBlue:         'MidnightBlue';
            case MintCream:            'MintCream';
            case MistyRose:            'MistyRose';
            case Moccasin:             'Moccasin';
            case NavajoWhite:          'NavajoWhite';
            case Navy:                 'Navy';
            case OldLace:              'OldLace';
            case Olive:                'Olive';
            case OliveDrab:            'OliveDrab';
            case Orange:               'Orange';
            case OrangeRed:            'OrangeRed';
            case Orchid:               'Orchid';
            case PaleGoldenRod:        'PaleGoldenRod';
            case PaleGreen:            'PaleGreen';
            case PaleTurquoise:        'PaleTurquoise';
            case PaleVioletRed:        'PaleVioletRed';
            case PapayaWhip:           'PapayaWhip';
            case PeachPuff:            'PeachPuff';
            case Peru:                 'Peru';
            case Pink:                 'Pink';
            case Plum:                 'Plum';
            case PowderBlue:           'PowderBlue';
            case Purple:               'Purple';
            case Red:                  'Red';
            case RosyBrown:            'RosyBrown';
            case RoyalBlue:            'RoyalBlue';
            case SaddleBrown:          'SaddleBrown';
            case Salmon:               'Salmon';
            case SandyBrown:           'SandyBrown';
            case SeaGreen:             'SeaGreen';
            case SeaShell:             'SeaShell';
            case Sienna:               'Sienna';
            case Silver:               'Silver';
            case SkyBlue:              'SkyBlue';
            case SlateBlue:            'SlateBlue';
//            case SlateGray:            'SlateGray';
            case SlateGrey:            'SlateGrey';
            case Snow:                 'Snow';
            case SpringGreen:          'SpringGreen';
            case SteelBlue:            'SteelBlue';
            case Tan:                  'Tan';
            case Teal:                 'Teal';
            case Thistle:              'Thestle';
            case Tomato:               'Tomato';
            case Turquoise:            'Turquoise';
            case Violet:               'Violet';
            case Wheat:                'Wheat';
            case White:                'White';
            case WhiteSmoke:           'WhiteSmoke';
            case Yellow:               'Yellow';
            case YellowGreen:          'YellowGreen';
        }
    }
}
enum abstract ARGBColours( Int ) to Int from Int {
    var AliceBlue =            0xFFF0F8FF;
    var AntiqueWhite =         0xFFFAEBD7;
//    var Aqua =                 0xFF00FFFF;
    var Aquamarine =           0xFF7FFFD4;
    var Azure =                0xFFF0FFFF;
    var Beige =                0xFFF5F5DC;
    var Bisque =               0xFFFFE4C4;
    var Black =                0xFF000000;
    var BlanchedAlmond =       0xFFFFEBCD;
    var Blue =                 0xFF0000FF;
    var BlueViolet =           0xFF8A2BE2;
    var Brown =                0xFFA52A2A;
    var BurlyWood =            0xFFDEB887;
    var CadetBlue =            0xFF5F9EA0;
    var Chartreuse =           0xFF7FFF00;
    var Chocolate =            0xFFD2691E;
    var Coral =                0xFFFF7F50;
    var CornflowerBlue =       0xFF6495ED;
    var Cornsilk =             0xFFFFF8DC;
    var Crimson =              0xFFDC143C;
    var Cyan =                 0xFF00FFFF;
    var DarkBlue =             0xFF00008B;
    var DarkCyan =             0xFF008B8B;
    var DarkGoldenRod =        0xFFB8860B;
//    var DarkGray =             0xFFA9A9A9;
    var DarkGrey =             0xFFA9A9A9;
    var DarkGreen =            0xFF006400;
    var DarkKhaki =            0xFFBDB76B;
    var DarkMagenta =          0xFF8B008B;
    var DarkOliveGreen =       0xFF556B2F;
    var Darkorange =           0xFFFF8C00;
    var DarkOrchid =           0xFF9932CC;
    var DarkRed =              0xFF8B0000;
    var DarkSalmon =           0xFFE9967A;
    var DarkSeaGreen =         0xFF8FBC8F;
    var DarkSlateBlue =        0xFF483D8B;
//    var DarkSlateGray =        0xFF2F4F4F;
    var DarkSlateGrey =        0xFF2F4F4F;
    var DarkTurquoise =        0xFF00CED1;
    var DarkViolet =           0xFF9400D3;
    var DeepPink =             0xFFFF1493;
    var DeepSkyBlue =          0xFF00BFFF;
    var DimGray =              0xFF696969;
    var DimGrey =              0xFF696969;
    var DodgerBlue =           0xFF1E90FF;
    var FireBrick =            0xFFB22222;
    var FloralWhite =          0xFFFFFAF0;
    var ForestGreen =          0xFF228B22;
//    var Fuchsia =              0xFFFF00FF;
    var Gainsboro =            0xFFDCDCDC;
    var GhostWhite =           0xFFF8F8FF;
    var Gold =                 0xFFFFD700;
    var GoldenRod =            0xFFDAA520;
//    var Gray =                 0xFF808080;
    var Grey =                 0xFF808080;
    var Green =                0xFF008000;
    var GreenYellow =          0xFFADFF2F;
    var HoneyDew =             0xFFF0FFF0;
    var HotPink =              0xFFFF69B4;
    var IndianRed =            0xFFCD5C5C;
    var Indigo =               0xFF4B0082;
    var Ivory =                0xFFFFFFF0;
    var Khaki =                0xFFF0E68C;
    var Lavender =             0xFFE6E6FA;
    var LavenderBlush =        0xFFFFF0F5;
    var LawnGreen =            0xFF7CFC00;
    var LemonChiffon =         0xFFFFFACD;
    var LightBlue =            0xFFADD8E6;
    var LightCoral =           0xFFF08080;
    var LightCyan =            0xFFE0FFFF;
    var LightGoldenRodYellow = 0xFFFAFAD2;
//    var LightGray =            0xFFD3D3D3;
    var LightGrey =            0xFFD3D3D3;
    var LightGreen =           0xFF90EE90;
    var LightPink =            0xFFFFB6C1;
    var LightSalmon =          0xFFFFA07A;
    var LightSeaGreen =        0xFF20B2AA;
    var LightSkyBlue =         0xFF87CEFA;
    var LightSlateGray =       0xFF778899;
    var LightSlateGrey =       0xFF778899;
    var LightSteelBlue =       0xFFB0C4DE;
    var LightYellow =          0xFFFFFFE0;
    var Lime =                 0xFF00FF00;
    var LimeGreen =            0xFF32CD32;
    var Linen =                0xFFFAF0E6;
    var Magenta =              0xFFFF00FF;
    var Maroon =               0xFF800000;
    var MediumAquaMarine =     0xFF66CDAA;
    var MediumBlue =           0xFF0000CD;
    var MediumOrchid =         0xFFBA55D3;
    var MediumPurple =         0xFF9370DB;
    var MediumSeaGreen =       0xFF3CB371;
    var MediumSlateBlue =      0xFF7B68EE;
    var MediumSpringGreen =    0xFF00FA9A;
    var MediumTurquoise =      0xFF48D1CC;
    var MediumVioletRed =      0xFFC71585;
    var MidnightBlue =         0xFF191970;
    var MintCream =            0xFFF5FFFA;
    var MistyRose =            0xFFFFE4E1;
    var Moccasin =             0xFFFFE4B5;
    var NavajoWhite =          0xFFFFDEAD;
    var Navy =                 0xFF000080;
    var OldLace =              0xFFFDF5E6;
    var Olive =                0xFF808000;
    var OliveDrab =            0xFF6B8E23;
    var Orange =               0xFFFFA500;
    var OrangeRed =            0xFFFF4500;
    var Orchid =               0xFFDA70D6;
    var PaleGoldenRod =        0xFFEEE8AA;
    var PaleGreen =            0xFF98FB98;
    var PaleTurquoise =        0xFFAFEEEE;
    var PaleVioletRed =        0xFFDB7093;
    var PapayaWhip =           0xFFFFEFD5;
    var PeachPuff =            0xFFFFDAB9;
    var Peru =                 0xFFCD853F;
    var Pink =                 0xFFFFC0CB;
    var Plum =                 0xFFDDA0DD;
    var PowderBlue =           0xFFB0E0E6;
    var Purple =               0xFF800080;
    var Red =                  0xFFFF0000;
    var RosyBrown =            0xFFBC8F8F;
    var RoyalBlue =            0xFF4169E1;
    var SaddleBrown =          0xFF8B4513;
    var Salmon =               0xFFFA8072;
    var SandyBrown =           0xFFF4A460;
    var SeaGreen =             0xFF2E8B57;
    var SeaShell =             0xFFFFF5EE;
    var Sienna =               0xFFA0522D;
    var Silver =               0xFFC0C0C0;
    var SkyBlue =              0xFF87CEEB;
    var SlateBlue =            0xFF6A5ACD;
//    var SlateGray =            0xFF708090;
    var SlateGrey =            0xFF708090;
    var Snow =                 0xFFFFFAFA;
    var SpringGreen =          0xFF00FF7F;
    var SteelBlue =            0xFF4682B4;
    var Tan =                  0xFFD2B48C;
    var Teal =                 0xFF008080;
    var Thistle =              0xFFD8BFD8;
    var Tomato =               0xFFFF6347;
    var Turquoise =            0xFF40E0D0;
    var Violet =               0xFFEE82EE;
    var Wheat =                0xFFF5DEB3;
    var White =                0xFFFFFFFF;
    var WhiteSmoke =           0xFFF5F5F5;
    var Yellow =               0xFFFFFF00;
    var YellowGreen =          0xFF9ACD32;
}
