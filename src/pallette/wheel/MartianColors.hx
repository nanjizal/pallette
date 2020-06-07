package pallette.wheel;
import pallette.wheel.martianColors.MartianColorsEnums;
/** 
   ![martianColors](../../bootstrap/img/martianColors.png)
**/
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