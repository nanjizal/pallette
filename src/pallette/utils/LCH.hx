package pallette.utils;
/** 
   { l, c, h, alpha }
   , L – perceived lightness, c – radius , h – angle , alpha -alpha
**/
@:structInit
class LCH {
    public var L = 0.; 
    public var c = 0.;
    public var h = 0.;
    public var alpha = 0.;
    public function new( L: Float, c: Float, h: Float, alpha: Float ){
        this.L = L; 
        this.c = c;
        this.h = h;
        this.alpha = alpha;
    }
}
