package pallette.utils;
/** 
   { l, a, b, alpha }
   , L – perceived lightness, a – how green/red the color is, b – how blue/yellow the color is, alpha -alpha
**/
@:structInit
class OKLAB {
    public var L = 0.; 
    public var a = 0.;
    public var b = 0.;
    public var alpha = 0.;
    public function new( L: Float, a: Float, b: Float, alpha: Float ){
        this.L = L; 
        this.a = a;
        this.b = b;
        this.alpha = alpha;
    }
}