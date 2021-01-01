package pallette.utils;
import pallette.utils.OKLAB;
inline
function htmlRGBA( r_: Float, g_: Float, b_: Float, a_: Float ): String {
    var r = r_;
    var g = g_;
    var b = b_;
    var a = a_;
    return 'rgba($r,$g,$b,$a)';
}
inline
function htmlHex( r: Float, g: Float, b: Float ): String
    return '#' + StringTools.hex( from_rgb( r, g, b ), 6 );
inline
function getBlack( r: Float, g: Float, b: Float ): Float {
    return 1. - Math.max( Math.max( r, b ), g );
}
inline
function from_oklab( L: Float, a: Float, b: Float, alpha: Float ): Int {
    var l_ = L + 0.3963377774 * a + 0.2158037573 * b;
    var m_ = L - 0.1055613458 * a - 0.0638541728 * b;
    var s_ = L - 0.0894841775 * a - 1.2914855480 * b;
    var l = l_*l_*l_;
    var m = m_*m_*m_;
    var s = s_*s_*s_;
    var red   = 4.0767245293*l - 3.3072168827*m + 0.2307590544*s;
    var green = - 1.2681437731*l + 2.6093323231*m - 0.3411344290*s;
    var blue  = - 0.0041119885*l - 0.7034763098*m + 1.7068625689*s;
    return from_argb( alpha, red, green, blue );
}
inline
function to_oklab( v: Int ):OKLAB {
    var r = redChannel( v );
    var g = greenChannel( v );
    var b = blueChannel( v );
    var a = alphaChannel( v );
    var l = 0.4121656120 * r + 0.5362752080 * g + 0.0514575653 * b;
    var m = 0.2118591070 * r + 0.6807189584 * g + 0.1074065790 * b;
    var s = 0.0883097947 * r + 0.2818474174 * g + 0.6302613616 * b;
    var l_ = Math.pow( l, 0.3 );
    var m_ = Math.pow( m, 0.3 );
    var s_ = Math.pow( s, 0.3 );
    return { L: 0.2104542553*l_ + 0.7936177850*m_ - 0.0040720468*s_
           , a: 1.9779984951*l_ - 2.4285922050*m_ + 0.4505937099*s_
           , b: 0.0259040371*l_ + 0.7827717662*m_ - 0.8086757660*s_
           , alpha: a };
}
inline
function from_cymka( c: Float, y: Float, m: Float, k: Float, a: Float ): Int
    return from_argb( a
                    , cymkConvert( c, k )
                    , cymkConvert( m, k )
                    , cymkConvert( y, k ) );
inline
function from_cymk( c: Float, y: Float, m: Float, k: Float ): Int
    return from_rgb(  cymkConvert( c, k )
                    , cymkConvert( m, k )
                    , cymkConvert( y, k ) );
inline
function from_argb( a: Float, r: Float, g: Float, b: Float ): Int
    return ( toHexInt( a ) << 24 ) 
         | ( toHexInt( r ) << 16 ) 
         | ( toHexInt( g ) << 8 ) 
         |   toHexInt( b );
inline
function from_rgb( r: Float, g: Float, b: Float ): Int
             return ( toHexInt( r ) << 16 ) 
                  | ( toHexInt( g ) << 8 ) 
                  |   toHexInt( b );
inline
function toHexInt( c: Float ): Int
    return Math.round( c * 255 );
inline
function rgbConvert( color: Float, k: Float ): Float
    return ( 1. - color - k )/( 1.-k );
inline
function cymkConvert( color: Float, black: Float ): Float 
    return ( 1 - color / 100 ) * ( 1 - black / 100 );
inline
function alphaChannel( int: Int ) : Float
    return ((int >> 24) & 255) / 255;
inline
function redChannel( int: Int ) : Float
    return ((int >> 16) & 255) / 255;
inline
function greenChannel( int: Int ) : Float
    return ((int >> 8) & 255) / 255;
inline
function blueChannel( int: Int ) : Float
    return (int & 255) / 255;
inline
function argbInt( a: Int, r: Int, g: Int, b: Int ){
    return a << 24 | r << 16 | g << 8 | b;
}
var percentHex( get, null ): Array<Int>;
inline
function get_percentHex(): Array<Int>{
    return [ 0x00, 0x30, 0x50, 0x80, 0x0A, 0x0D, 0x0F, 0x12, 0x14, 0x17
           , 0x19, 0x1C, 0x1F, 0x21, 0x24, 0x26, 0x29, 0x2B, 0x2E, 0x30
           , 0x33, 0x36, 0x38, 0x3B, 0x3D, 0x40, 0x42, 0x45, 0x47, 0x4A
           , 0x4C, 0x4F, 0x52, 0x54, 0x57, 0x59, 0x5C, 0x5E, 0x61, 0x63
           , 0x66, 0x69, 0x6B, 0x6E, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7D
           , 0x7F, 0x82, 0x85, 0x87, 0x8A, 0x8C, 0x8F, 0x91, 0x94, 0x96
           , 0x99, 0x9C, 0x9E, 0xA1, 0xA3, 0xA6, 0xA8, 0xAB, 0xAD, 0xB0
           , 0xB2, 0xB5, 0xBA, 0xBD, 0xBF, 0xC2, 0xC4, 0xC7, 0xC9, 0xC9
           , 0xCC, 0xCF, 0xD1, 0xD4, 0xD6, 0xD9, 0xDB, 0xDE, 0xE0, 0xE3
           , 0xE5, 0xE8, 0xEB, 0xED, 0xF0, 0xF2, 0xF5, 0xF7, 0xFA, 0xFC
           , 0xFF ];
}
inline
function percentWhite( percent: Int ){
    var v = percentHex[ percent ];
    return argbInt( 0xFF, v, v, v );
}
inline
function percentBlack( percent: Int ){
    var v = percentHex[ 100 - percent ];
    return argbInt( 0xFF, v, v, v );
}
inline
function rgbPercent( rPercent: Int, gPercent: Int, bPercent: Int ){
    return argbInt( 0xFF, percentHex[ rPercent ], percentHex[ gPercent ], percentHex[ bPercent ] );
}
inline 
function percentColor( rPercent: Int, gPercent: Int, bPercent: Int ){
    return argbInt( 0xFF, percentHex[ rPercent ], percentHex[ gPercent ], percentHex[ bPercent ] );
}
inline
function percentDarkColor( rPercent: Int, gPercent: Int, bPercent: Int ){
    return argbInt( 0xFF, percentHex[ 100 - rPercent ], percentHex[ 100 - gPercent ], percentHex[ 100 - bPercent ] );
}
inline 
function percentRed( rPercent: Int ){
    return argbInt( 0xFF, percentHex[ rPercent ], 0x00, 0x00 );
}
inline 
function percentGreen( gPercent: Int ){
    return argbInt( 0xFF, 0xFF, percentHex[ gPercent ], 0xFF );
}
inline 
function percentBlue( bPercent: Int ){
    return argbInt( 0xFF, 0xFF, 0xFF, percentHex[ bPercent ] );
}
inline 
function percentRedSoft( rPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    return argbInt( 0xFF, percentHex[ rPercent ], soft, soft );
}
inline 
function percentGreenSoft( gPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    return argbInt( 0xFF, soft, percentHex[ gPercent ], soft );
}
inline 
function percentBlueSoft( bPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    return argbInt( 0xFF, soft, soft, percentHex[ bPercent ] );
}
inline
function percentYellowSoft( bPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    var color = percentHex[ bPercent ];
    return argbInt( 0xFF, color, color, soft );
}
inline
function percentMagentaSoft( bPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    var color = percentHex[ bPercent ];
    return argbInt( 0xFF, color, soft, color );
}
inline
function percentCyanSoft( bPercent: Int, percentSoft: Int ){
    var soft = percentHex[ percentSoft ];
    var color = percentHex[ bPercent ];
    return argbInt( 0xFF, soft, color, color );
}
class ColorHelper {
    public var htmlRGBA_: ( r_: Float, g_: Float, b_: Float, a_: Float ) -> String = htmlRGBA;
    public var htmlHex_: ( r: Float, g: Float, b: Float ) -> String = htmlHex;
    public var getBlack_: ( r: Float, g: Float, b: Float ) -> Float = getBlack; 
    public var from_oklab_:( L: Float, a: Float, b: Float, alpha: Float ): Int = from_oklab;
    public var to_oklab_:( v: Int ): OKLAB = to_oklab;
    public var from_cymka_: ( c: Float, y: Float, m: Float, k: Float, a: Float ) -> Int = from_cymka;
    public var from_argb_: ( a: Float, r: Float, g: Float, b: Float ) -> Int = from_argb;
    public var toHexInt_: ( c: Float ) -> Int = toHexInt;
    public var rgbConvert_: ( color: Float, k: Float ) -> Float = rgbConvert;
    public var cymkConvert_: ( color: Float, black: Float ) -> Float = cymkConvert;
    public var alphaChannel_: ( int: Int ) -> Float = alphaChannel;
    public var redChannel_: ( int: Int ) -> Float = redChannel;
    public var greenChannel_: ( int: Int ) -> Float = greenChannel;
    public var blueChannel_: ( int: Int ) -> Float = blueChannel;
    
    public var get_percentHex_: ()->Array<Int> = get_percentHex;
    public var percentWhite_: ( percent: Int )->Int = percentWhite;
    public var percentBlack_:( percent: Int )->Int = percentBlack;
    public var rgbPercent_:( rPercent: Int, gPercent: Int, bPercent: Int )->Int = rgbPercent;
    public var percentColor_:( rPercent: Int, gPercent: Int, bPercent: Int )->Int = percentColor;
    public var percentDarkColor_:( rPercent: Int, gPercent: Int, bPercent: Int )->Int = percentDarkColor;
    public var percentRed_:( rPercent: Int )->Int = percentRed;
    public var percentGreen_:( gPercent: Int )->Int = percentGreen;
    public var percentBlue_:( bPercent: Int )->Int = percentBlue;
    public var percentRedSoft_:( rPercent: Int, percentSoft: Int )->Int = percentRedSoft;
    public var percentGreenSoft_:( gPercent: Int, percentSoft: Int )->Int = percentGreenSoft;
    public var percentBlueSoft_:( bPercent: Int, percentSoft: Int )->Int = percentBlueSoft;
    public var percentYellowSoft_:( bPercent: Int, percentSoft: Int )->Int = percentYellowSoft;
    public var percentMagentaSoft_:( bPercent: Int, percentSoft: Int )->Int = percentMagentaSoft;
    public var percentCyanSoft_:( bPercent: Int, percentSoft: Int )->Int = percentCyanSoft;
}
