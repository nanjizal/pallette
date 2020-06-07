package pallette.wheel;
import pallette.MartianColours;
class MartianColours{
    static inline function limitRadian( radian: Float ){
        while( true ){
            if( radian < 0 ) {
                radian += Math.PI*2;
            } else { 
                break;
            }
        }
        while( true ){
            if( radian > Math.PI*2 ) {
                radian -= Math.PI*2;
            } else { 
                break;
            }
        }
        return radian;
    }
    static inline function limitStrength( strength: Float ){
        if( strength < 0. ) strength = 0;
        if( strength > 1. ) strength = 1;
        return strength;
    }
    public static function getColor( radian: Float, strength: Float ){
        radian = limitRadian( radian );
        var section = Std.int( radian/( Math.PI/12 ) );
        strength = limitStrength( strength );
        var index = Std.int( strength*5 );
        var out: Int = switch( section ){
            case 0:
                return cast reds[ index ];
            case 1:
                return cast oranges[ index ];
            case 2: 
                return cast turmeric[ index ];
            case 3:
                return cast yellowCheese[ index ];
            case 4:
                return cast yellows[ index ];
            case 5:
                return cast greenGrape[ index ];
            case 6:
                return cast chartreuse[ index ];
            case 7:
                return cast greenPea[ index ];
            case 8:
                return cast green[ index ];
            case 9:
                return cast clover[ index ];
            case 10:
                return cast emerald[ index ];
            case 11:
                return cast malachite[ index ];
            case 12:
                return cast cyan[ index ];
            case 13:
                return cast turquoise[ index ];
            case 14:
                return cast azure[ index ];
            case 15:
                return cast royalBlue[ index ];
            case 16:
                return cast blue[ index ];
            case 17:
                return cast dioxazine[ index ];
            case 18:
                return cast violet[ index ];
            case 19:
                return cast aniline[ index ];
            case 20:
                return cast magenta[ index ];
            case 21:
                return cast bougainville[ index ];
            case 22:
                return cast pink[ index ];
            case 23: 
                return cast redPlumb[ index ];
            default:
                return cast reds[ index ];
        }
        return out;
    }
    public static
    var reds( get, null ):Array<Reds>;
    public static inline 
    function get_reds(): Array<Reds> {
        return [ chickenBreast, paleRaspberry, Reds.red, darkRed, marron ];
    }
    public static
    var oranges( get, null ):Array<Oranges>;
    public static inline
    function get_oranges(): Array<Oranges> {
        return [ parmesan, peanutButter, orange, brown, darkBrown ];
    }
    public static
    var turmeric( get, null ): Array<Turmeric>;
    public static inline
    function get_turmeric():Array<Turmeric>{
        return[ buff, Turmeric.turmeric, yellowOchre, tan, milkChocolate ];
    }
    public static
    var yellowCheese( get, null ): Array<YellowCheese>;
    public static inline
    function get_yellowCheese(): Array<YellowCheese> {
        return [ wheatEar, YellowCheese.yellowCheese, oliveOil, caneToad, cowDung ];
    }
    public static
    var yellows( get, null ): Array<Yellows>;
    public static inline
    function get_yellows():Array<Yellows>{
        return [ butter, Yellows.yellow, wasabi, olive, oliveDrab ];
    }
    public static
    var greenGrape( get, null ): Array<GreenGrape>;
    public static inline
    function get_greenGrape(): Array<GreenGrape> {
        return [ champagne, goldenDelicious, GreenGrape.greenGrape, lightKelp, darkKelp ];
    }
    public static
    var chartreuse( get, null ): Array<Chartreuse>;
    public static inline
    function get_chartreuse(): Array<Chartreuse> {
        return [ avacado, Chartreuse.chartreuse, celery, sage, oakLeaf ];
    }
    public static
    var greenPea( get, null ): Array<GreenPea>;
    public static inline
    function get_greenPea(): Array<GreenPea> {
        return [ greenCabbage, GreenPea.greenPea, basil, spinach, rhubarbLeaf ];
    }
    public static 
    var green( get, null ): Array<Green>;
    public static inline
    function get_green(): Array<Green> {
        return [ greenHellebore, grannySmith, Green.green, grassGreen, zucchini ];
    }
    public static
    var clover( get, null ): Array<Clover>;
    public static inline
    function get_clover(): Array<Clover> {
        return [ celadon, chayote, Clover.clover, shadedFern, cucumber ];
    }
    public static
    var emerald( get, null ): Array<Emerald>;
    public static inline
    function get_emerald(): Array<Emerald> {
        return [ variscite, chrysolite, lightEmerald, Emerald.emerald, brunswickGreen ];
    }
    public static
    var malachite( get, null ): Array<Malachite>;
    public static inline
    function get_malachite(): Array<Malachite>{
        return [ blueAgave, verdigris, shallowSeaGreen, broccoli, Malachite.malachite ];
    }
    public static
    var cyan( get, null ): Array<Cyan>;
    public static inline
    function get_cyan(): Array<Cyan> {
        return [ blueSpruceLight, Cyan.cyan, darkCyan, blueSpruceDark, pthaloGreen ];
    }
    public static 
    var turquoise( get, null ): Array<Turquoise>;
    public static inline
    function get_turquoise(): Array<Turquoise> {
        return [ uranus, Turquoise.turquoise, blueTopaz, seaGreen, darkSeaGreen ];
    }
    public static 
    var azure( get, null ): Array<Azure>;
    public static inline
    function get_azure(): Array<Azure> {
        return [ powderBlue, lightAzure, darkAzure, cobaltBlue, prussianBlue ];
    }
    public static
    var royalBlue( get, null ): Array<RoyalBlue>;
    public static inline
    function get_royalBlue(): Array<RoyalBlue> {
        return [ paleSkyBlue, skyBlue, delphiniumBlue, RoyalBlue.royalBlue, darkRoyalBlue ];
    }
    public static
    var blue( get, null ): Array<Blue>;
    public static inline
    function get_blue(): Array<Blue> {
        return [ forgetMeNot, cornflower, lightBlue, Blue.blue, darkBlue ];
    }
    public static
    var dioxazine( get, null ): Array<Dioxazine>;
    public static inline
    function get_dioxazine(): Array<Dioxazine> {
        return [ rosaDeFrance, lavender, hanPurple, darkHanPurple, Dioxazine.dioxazine ];
    }
    public static
    var violet( get, null ): Array<Violet>;
    public static inline
    function get_violet(): Array<Violet> {
        return [ mauve, kunzite, Violet.violet, darkViolet, spectralViolet ];
    }
    public static
    var aniline( get, null ): Array<Aniline>;
    public static inline
    function get_aniline(): Array<Aniline> {
        return [ lilac, roseOfSharon, purpleDaisy, Aniline.aniline, amethyst ];
    }
    public static
    var magenta( get, null ): Array<Magenta>;
    public static inline
    function get_magenta(): Array<Magenta> {
        return [ lightMusk, musk, Magenta.magenta, darkMagenta, purple ];
    }
    public static
    var bougainville( get, null ): Array<Bougainville>;
    public static inline
    function get_bougainville(): Array<Bougainville> {
        return [ dogRose, purpleLoosestrife, shockingPink, purpleBougainvillea, purpleBean ];
    }
    public static
    var pink( get, null ): Array<Pink>;
    public static inline
    function get_pink(): Array<Pink> {
        return [ lightPink, Pink.pink, darkPink, pricklyPear, elderberry ];
    }
    public static
    var redPlumb( get, null ): Array<RedPlum>;
    public static inline
    function get_redPlumb(): Array<RedPlum>{
        return [ babyPink, pinkHydrangea, dragonFriut, chineseStrawberry, RedPlum.redPlum ];
    }
}

#if (kha||heaps) 

@:enum
abstract Reds( Int ) to Int from Int {
    var chickenBreast   = 0xFFFFBFB2;
    var paleRaspberry   = 0xFFFF907A;
    var red             = 0xFFFF0000;
    var darkRed         = 0xFFA10000;
    var marron          = 0xFF660000;
}
@:enum
abstract Oranges( Int ) to Int from Int {
    var parmesan        = 0xFFFFD2A6;
    var peanutButter    = 0xFFFFB266;
    var orange          = 0xFFFF8000;
    var brown           = 0xFFA65300;
    var darkBrown       = 0xFF5F2F00;
}
@:enum
abstract Turmeric( Int ) to Int from Int {
    var buff            = 0xFFFFDAA6;
    var turmeric        = 0xFFFFBF00;
    var yellowOchre     = 0xFFD99800;
    var tan             = 0xFF996B00;
    var milkChocolate   = 0xFF523900;
}
@:enum
abstract YellowCheese( Int ) to Int from Int {
    var wheatEar        = 0xFFFFE8A1;
    var yellowCheese    = 0xFFFFD400;
    var oliveOil        = 0xFFCCAA00;
    var caneToad        = 0xFF8C7400;
    var cowDung         = 0xFF473C00;
}
@:enum
abstract Yellows( Int ) to Int from Int {
  var butter            = 0xFFFFFFA6;
  var yellow            = 0xFFFFFF00;
  var wasabi            = 0xFFC4C400;
  var olive             = 0xFF8A8A00;
  var oliveDrab         = 0xFF454500;
}
@:enum
abstract GreenGrape( Int ) to Int from Int {
    var champagne       = 0xFFECFFA6;
    var goldenDelicious = 0xFFDDFF00;
    var greenGrape      = 0xFFB6C700;
    var lightKelp       = 0xFF7A8500;
    var darkKelp        = 0xFF3C4200;
}
@:enum
abstract Chartreuse( Int ) to Int from Int {
    var avacado         = 0xFFDBFF9E;
    var chartreuse      = 0xFFBBFF00;
    var celery          = 0xFF96CC00;
    var sage            = 0xFF6A9100;
    var oakLeaf         = 0xFF334500;
}
@:enum
abstract GreenPea( Int ) to Int from Int {
    var greenCabbage    = 0xFFC6FF9E;
    var greenPea        = 0xFF9DFF00;
    var basil           = 0xFF6CC400;
    var spinach         = 0xFF549900;
    var rhubarbLeaf     = 0xFF294A00;
}
@:enum
abstract Green( Int ) to Int from Int {
    var greenHellebore  = 0xFFB2FFA3;
    var grannySmith     = 0xFF00FF00;
    var green           = 0xFF00BF00;
    var grassGreen      = 0xFF009900;
    var zucchini        = 0xFF004F00;
}
@:enum
abstract Clover( Int ) to Int from Int {
    var celadon         = 0xFFA8FFAB;
    var chayote         = 0xFF00FF73;
    var clover          = 0xFF00B551;
    var shadedFern      = 0xFF009945;
    var cucumber        = 0xFF004F24;
}
@:enum
abstract Emerald( Int ) to Int from Int {
    var variscite       = 0xFFABFFC6;
    var chrysolite      = 0xFF00FFAA;
    var lightEmerald    = 0xFF00B277;
    var emerald         = 0xFF009463;
    var brunswickGreen  = 0xFF004C33;
}
@:enum
abstract Malachite( Int ) to Int from Int {
    var blueAgave      = 0xFFA3FFD4;
    var verdigris      = 0xFF00FFC3;
    var shallowSeaGreen= 0xFF00B89F;
    var broccoli       = 0xFF00917E;
    var malachite      = 0xFF004C42;
}
@:enum
abstract Cyan( Int ) to Int from Int {
    var blueSpruceLight = 0xFFA6FFFF;
    var cyan            = 0xFF00FFFF;
    var darkCyan        = 0xFF00B2B2;
    var blueSpruceDark  = 0xFF008C8C;
    var pthaloGreen     = 0xFF004A4A;
}
@:enum
abstract Turquoise( Int ) to Int from Int {
    var uranus          = 0xFF99DDFF;
    var turquoise       = 0xFF00C3FF;
    var blueTopaz       = 0xFF0099B8;
    var seaGreen        = 0xFF007F99;
    var darkSeaGreen    = 0xFF00424F;
}
@:enum
abstract Azure( Int ) to Int from Int {
    var powderBlue      = 0xFF91C8FF;
    var lightAzure      = 0xFF00AAFF;
    var darkAzure       = 0xFF0077B2;
    var cobaltBlue      = 0xFF005A87;
    var prussianBlue    = 0xFF003957;
}
@:enum
abstract RoyalBlue( Int ) to Int from Int {
    var paleSkyBlue     = 0xFF9CBDFF;
    var skyBlue         = 0xFF73A2FF;
    var delphiniumBlue  = 0xFF006EFF;
    var royalBlue       = 0xFF004299;
    var darkRoyalBlue   = 0xFF002C66;
}
@:enum
abstract Blue( Int ) to Int from Int {
    var forgetMeNot     = 0xFFABABFF;
    var cornflower      = 0xFF8585FF;
    var lightBlue       = 0xFF4C58FF;
    var blue            = 0xFF0000FF;
    var darkBlue        = 0xFF00007A;
}
@:enum
abstract Dioxazine( Int ) to Int from Int {
    var rosaDeFrance    = 0xFFD9BFFF;
    var lavender        = 0xFFB580FF;
    var hanPurple       = 0xFF6A00FF;
    var darkHanPurple   = 0xFF4A00B2;
    var dioxazine       = 0xFF350080;
}
@:enum
abstract Violet( Int ) to Int from Int {
    var mauve           = 0xFFE9BFFF;
    var kunzite         = 0xFFD580FF;
    var violet          = 0xFFAA00FF;
    var darkViolet      = 0xFF7700B2;
    var spectralViolet  = 0xFF4C0073;
}
@:enum
abstract Aniline( Int ) to Int from Int {
    var lilac           = 0xFFF4BFFF;
    var roseOfSharon    = 0xFFEC8CFF;
    var purpleDaisy     = 0xFFD400FF;
    var aniline         = 0xFF9400B2;
    var amethyst        = 0xFF5A006B;
}
@:enum
abstract Magenta( Int ) to Int from Int {
    var lightMusk       = 0xFFFFBFFF;
    var musk            = 0xFFFF99FF;
    var magenta         = 0xFFFF00FF;
    var darkMagenta     = 0xFFA600A6;
    var purple          = 0xFF660066;
}
@:enum 
abstract Bougainville( Int ) to Int from Int {
    var dogRose         = 0xFFFFBFF2;
    var purpleLoosestrife = 0xFFFF8CE8;
    var shockingPink    = 0xFFFF00CC;
    var purpleBougainvillea = 0xFFB2008F;
    var purpleBean      = 0xFF6B0055;
}
@:enum
abstract Pink( Int ) to Int from Int {
    var lightPink       = 0xFFFFBFE9;
    var pink            = 0xFFFF80D5;
    var darkPink        = 0xFFFF00AA;
    var pricklyPear     = 0xFFB20077;
    var elderberry      = 0xFF70004A;
}
@:enum
abstract RedPlum( Int ) to Int from Int {
    var babyPink        = 0xFFFFC2DE;
    var pinkHydrangea   = 0xFFFF80B9;
    var dragonFriut     = 0xFFFF0073;
    var chineseStrawberry = 0xFFB20051;
    var redPlum         = 0xFF750035;
}


#else


@:enum
abstract Reds( Int ) to Int from Int {
    var chickenBreast   = 0xFFBFB2;
    var paleRaspberry   = 0xFF907A;
    var red             = 0xFF0000;
    var darkRed         = 0xA10000;
    var marron          = 0x660000;
}
@:enum
abstract Oranges( Int ) to Int from Int {
    var parmesan        = 0xFFD2A6;
    var peanutButter    = 0xFFB266;
    var orange          = 0xFF8000;
    var brown           = 0xA65300;
    var darkBrown       = 0x5F2F00;
}
@:enum
abstract Turmeric( Int ) to Int from Int {
    var buff           = 0xFFDAA6;
    var turmeric       = 0xFFBF00;
    var yellowOchre    = 0xD99800;
    var tan            = 0x996B00;
    var milkChocolate  = 0x523900;
}
@:enum
abstract YellowCheese( Int ) to Int from Int {
    var wheatEar      = 0xFFE8A1;
    var yellowCheese  = 0xFFD400;
    var oliveOil      = 0xCCAA00;
    var caneToad      = 0x8C7400;
    var cowDung       = 0x473C00;
}
@:enum
abstract Yellows( Int ) to Int from Int {
  var butter          = 0xFFFFA6;
  var yellow          = 0xFFFF00;
  var wasabi          = 0xC4C400;
  var olive           = 0x8A8A00;
  var oliveDrab       = 0x454500;
}
@:enum
abstract GreenGrape( Int ) to Int from Int {
    var champagne     = 0xECFFA6;
    var goldenDelicious = 0xDDFF00;
    var greenGrape    = 0xB6C700;
    var lightKelp     = 0x7A8500;
    var darkKelp      = 0x3C4200;
}
@:enum
abstract Chartreuse( Int ) to Int from Int {
    var avacado       = 0xDBFF9E;
    var chartreuse    = 0xBBFF00;
    var celery        = 0x96CC00;
    var sage          = 0x6A9100;
    var oakLeaf       = 0x334500;
}
@:enum
abstract GreenPea( Int ) to Int from Int {
    var greenCabbage  = 0xC6FF9E;
    var greenPea      = 0x9DFF00;
    var basil         = 0x6CC400;
    var spinach       = 0x549900;
    var rhubarbLeaf   = 0x294A00;
}
@:enum
abstract Green( Int ) to Int from Int {
    var greenHellebore = 0xB2FFA3;
    var grannySmith   = 0x00FF00;
    var green         = 0x00BF00;
    var grassGreen    = 0x009900;
    var zucchini      = 0x004F00;
}
@:enum
abstract Clover( Int ) to Int from Int {
    var celadon       = 0xA8FFAB;
    var chayote       = 0x00FF73;
    var clover        = 0x00B551;
    var shadedFern    = 0x009945;
    var cucumber      = 0x004F24;
}
@:enum
abstract Emerald( Int ) to Int from Int {
    var variscite     = 0xABFFC6;
    var chrysolite    = 0x00FFAA;
    var lightEmerald  = 0x00B277;
    var emerald       = 0x009463;
    var brunswickGreen = 0x004C33;
}
@:enum
abstract Malachite( Int ) to Int from Int {
    var blueAgave     = 0xA3FFD4;
    var verdigris     = 0x00FFC3;
    var shallowSeaGreen = 0x00B89F;
    var broccoli      = 0x00917E;
    var malachite     = 0x004C42;
}
@:enum
abstract Cyan( Int ) to Int from Int {
    var blueSpruceLight = 0xA6FFFF;
    var cyan          = 0x00FFFF;
    var darkCyan      = 0x00B2B2;
    var blueSpruceDark = 0x008C8C;
    var pthaloGreen   = 0x004A4A;
}
@:enum
abstract Turquoise( Int ) to Int from Int {
    var uranus        = 0x99DDFF;
    var turquoise     = 0x00C3FF;
    var blueTopaz     = 0x0099B8;
    var seaGreen      = 0x007F99;
    var darkSeaGreen  = 0x00424F;
}
@:enum
abstract Azure( Int ) to Int from Int {
    var powderBlue   = 0x91C8FF;
    var lightAzure   = 0x00AAFF;
    var darkAzure    = 0x0077B2;
    var cobaltBlue   = 0x005A87;
    var prussianBlue = 0x003957;
}
@:enum
abstract RoyalBlue( Int ) to Int from Int {
    var paleSkyBlue  = 0x9CBDFF;
    var skyBlue      = 0x73A2FF;
    var delphiniumBlue = 0x006EFF;
    var royalBlue    = 0x004299;
    var darkRoyalBlue = 0x002C66;
}
@:enum
abstract Blue( Int ) to Int from Int {
    var forgetMeNot  = 0xABABFF;
    var cornflower   = 0x8585FF;
    var lightBlue    = 0x4C58FF;
    var blue         = 0x0000FF;
    var darkBlue     = 0x00007A;
}
@:enum
abstract Dioxazine( Int ) to Int from Int {
    var rosaDeFrance = 0xD9BFFF;
    var lavender     = 0xB580FF;
    var hanPurple    = 0x6A00FF;
    var darkHanPurple = 0x4A00B2;
    var dioxazine    = 0x350080;
}
@:enum
abstract Violet( Int ) to Int from Int {
    var mauve        = 0xE9BFFF;
    var kunzite      = 0xD580FF;
    var violet       = 0xAA00FF;
    var darkViolet   = 0x7700B2;
    var spectralViolet = 0x4C0073;
}
@:enum
abstract Aniline( Int ) to Int from Int {
    var lilac        = 0xF4BFFF;
    var roseOfSharon = 0xEC8CFF;
    var purpleDaisy  = 0xD400FF;
    var aniline      = 0x9400B2;
    var amethyst     = 0x5A006B;
}
@:enum
abstract Magenta( Int ) to Int from Int {
    var lightMusk   = 0xFFBFFF;
    var musk        = 0xFF99FF;
    var magenta     = 0xFF00FF;
    var darkMagenta = 0xA600A6;
    var purple      = 0x660066;
}
@:enum 
abstract Bougainville( Int ) to Int from Int {
    var dogRose     = 0xFFBFF2;
    var purpleLoosestrife = 0xFF8CE8;
    var shockingPink = 0xFF00CC;
    var purpleBougainvillea = 0xB2008F;
    var purpleBean  = 0x6B0055;
}
@:enum
abstract Pink( Int ) to Int from Int {
    var lightPink   = 0xFFBFE9;
    var pink        = 0xFF80D5;
    var darkPink    = 0xFF00AA;
    var pricklyPear = 0xB20077;
    var elderberry  = 0x70004A;
}
@:enum
abstract RedPlum( Int ) to Int from Int {
    var babyPink    = 0xFFC2DE;
    var pinkHydrangea = 0xFF80B9;
    var dragonFriut = 0xFF0073;
    var chineseStrawberry = 0xB20051;
    var redPlum     = 0x750035;
}
#end
