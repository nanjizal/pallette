package pallette.utils;
/** 
   { r, g, b }
**/
@:structInit
class RGB {
    public var r = 0.;
    public var g = 0.;
    public var b = 0.;
    public function new( r: Float, g: Float, b: Float ){
        this.r = r;
        this.g = g;
        this.b = b;
    }
}
