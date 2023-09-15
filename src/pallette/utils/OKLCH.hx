package pallette.utils;
import pallette.utils.LCH;
/** 
   { l, c, h, alpha }
   , L – perceived lightness, c – radius, h – angle, alpha -alpha
**/
@:forward
abstract OKLCH( LCH ) from LCH to LCH {
    public inline
    function new( L: Float, c: Float, h: Float, alpha: Float ){
        this = new LCH( L, c, h, alpha ); 
    }
}
