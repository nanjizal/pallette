package pallette.utils;

import pallette.utils.ARGB;
import pallette.utils.RGB;
import pallette.utils.CYMKA;
import pallette.utils.CYMK;
import pallette.utils.ColorHelper;

abstract ColorInt( Int ) to Int from Int {
    public inline
    function new( v: Int ){
        this = v;
    }
    @:from
    static public inline
    function fromARGB( argb: ARGB ): ColorInt {
        return new ColorInt( from_argb( argb.a, argb.r, argb.g, argb.b ) );
    }
    @:from
    static public inline
    function fromRGB( argb: RGB ): ColorInt {
        return new ColorInt( from_argb( 1., argb.r, argb.g, argb.b ) );
    }
    @:to
    public inline
    function htmlStyleRGBA(): String {
        return htmlRGBA( red, green, blue, alpha );
    }
    @:to
    public inline
    function htmlStyleHex(): String {
        return htmlHex( red, green, blue );
    }
    @:to
    public inline
    function toARGB(): ARGB {
        return new ARGB( alpha, red, green, blue );
    }
    @:to
    public inline
    function toRGB(): RGB {
        return new RGB( red, green, blue );
    }
    @:from
    static public inline
    function fromCYMKA( c: CYMKA ):ColorInt {
        return new ColorInt( from_cymka( c.c, c.y, c.m, c.k, c.a ) );
    }
    @:from
    static public inline
    function fromCYMK( c: CYMK ):ColorInt {
        return new ColorInt( from_cymk( c.c, c.y, c.m, c.k ) );
    }
    @:to
    public inline
    function toCYMKA(): CYMKA {
        var k = black;
        var c = rgbConvert( red, k );
        var m = rgbConvert( green, k );
        var y = rgbConvert( blue, k );
        return new CYMKA( c, y, m, k, alpha );
    }
    @:to
    public inline
    function toCYMK(): CYMK {
        var k = black;
        var c = rgbConvert( red, k );
        var m = rgbConvert( green, k );
        var y = rgbConvert( blue, k );
        return new CYMK( c, y, m, k );
    }
    public var cyan( get, set ): Float;
    inline
    function get_cyan(): Float {
        return rgbConvert( red, black );
    }
    inline 
    function set_cyan( v: Float ): Float {
        var k = black;
        var m = rgbConvert( green, k );
        var y = rgbConvert( blue, k );
        this = new ColorInt( from_cymka( v, y, m, k, alpha ) );
        return v;
    }
    public var yellow( get, set ): Float;
    inline
    function get_yellow(): Float {
        return rgbConvert( blue, black );
    }
    inline
    function set_yellow( v: Float ): Float {
        var k = black;
        var c = rgbConvert( red, k );
        var m = rgbConvert( green, k );
        this = new ColorInt( from_cymka( v, v, m, k, alpha ) );
        return v;
    }
    public var magenta( get, set ): Float;
    inline
    function get_magenta(): Float {
        return rgbConvert( green, black );
    }
    inline
    function set_magenta( v: Float ): Float {
        var k = black;
        var c = rgbConvert( red, k );
        var y = rgbConvert( blue, k );
        this = new ColorInt( from_cymka( c, y, v, k, alpha ) );
        return v;
    }
    public var black( get, set ): Float;
    inline function get_black(): Float {
        return getBlack( red, green, blue );
    }
    inline function set_black( v: Float ): Float {
        var k = black;
        var c = rgbConvert( red, k );
        var m = rgbConvert( green, k );
        var y = rgbConvert( blue, k );
        this = new ColorInt( from_cymka( c, y, m, v, alpha ) );
        return v;
    }
    public var alpha( get, set ): Float;
    inline
    function get_alpha(): Float {
        return alphaChannel( this );
    }
    inline
    function set_alpha( v: Float ): Float {
        this = new ColorInt( from_argb( v, red, green, blue ) );
        return v;
    }
    public var red( get, set ): Float;
    inline
    function get_red(): Float {
        return redChannel( this );
    }
    inline
    function set_red( v: Float ): Float {
        this = new ColorInt( from_argb( alpha, v, green, blue ) );
        return v;
    }
    public var green( get, set ): Float;
    inline
    function get_green(): Float {
        return greenChannel( this );
    }
    inline
    function set_green( v: Float ): Float {
        this = new ColorInt( from_argb( alpha, red, v, blue ) );
        return v;
    }
    public var blue( get, set ): Float;
    inline
    function get_blue(): Float {
        return blueChannel( this );
    }
    inline
    function set_blue( v: Float ): Float {
        this = new ColorInt( from_argb( alpha, red, green, v ) );
        return v;
    }
    // String CYMK typically created by ilustrator export from flash
    static public inline
    function aiCYMKA( arr: Array<String>, alpha: Float = 1.0 ): ColorInt {
        return new ColorInt( from_cymka( Std.parseFloat( arr[0] )
                                       , Std.parseFloat( arr[1] )
                                       , Std.parseFloat( arr[2] )
                                       , Std.parseFloat( arr[3] ), alpha ) );
    }
    // not strictly part of this class, but kind of useful rather than going through Int
    // because has structures prefer not in colorHelper?
    static public inline
    function ARGB_CYMKA( v: ARGB ){
        var k = getBlack( v.r, v.g, v.b );
        var c = rgbConvert( v.r, k );
        var m = rgbConvert( v.g, k );
        var y = rgbConvert( v.b, k );
        return new CYMKA( c, y, m, k, v.a );
    }
    // not strictly part of this class, but kind of useful rather than going through Int
    // because has structures prefer not in colorHelper?
    static public inline
    function CYMKA_ARGB( v: CYMKA ): ARGB {
        var r = cymkConvert( v.c, v.k );
        var g = cymkConvert( v.m, v.k );
        var b = cymkConvert( v.y, v.k ); 
        return new ARGB( v.a, r, g, b );
    }
    public inline
    function luminosityGrey( scale: Float = 1. ): Float {
        return alpha*( 0.21*red + 0.72*green + 0.07*blue ) * scale;
    }
    public inline
    function blendARGB( colA: ColorInt, colB: ColorInt, t: Float ): Int {
        // blend each channel colors
        var v = smootherStep( t );
        var r = blend( colA.red,   colB.red,   v );
        var g = blend( colA.green, colB.green, v );
        var b = blend( colA.blue,  colB.blue,  v );
        var a = blend( colA.alpha, colB.alpha, v );
        // put together
        var argb: ARGB = { a: a, r: r, g: g, b: b };
        var colInt: ColorInt = argb;
        var c: Int = colInt;
        return c;
    }
    public inline
    function blendRGB( colA: ColorInt, colB: ColorInt, t: Float ): Int {
        // blend each channel colors
        var v = smootherStep( t );
        var r = blend( colA.red,   colB.red,   v );
        var g = blend( colA.green, colB.green, v );
        var b = blend( colA.blue,  colB.blue,  v );
        // put together
        var argb: ARGB = { a: 1., r: r, g: g, b: b };
        var colInt: ColorInt = argb;
        var c: Int = colInt;
        return c;
    }
    inline
    function blend( a: Float, b: Float, t: Float ): Float {
        return a + t * ( b - a );
    }
    // Ken Perlin smoothStep 
    inline 
    function smootherStep( t: Float ): Float {
      return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
    }
}
