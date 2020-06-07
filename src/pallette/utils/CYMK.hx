package pallette.utils;
/** 
   { c, y, m, k }
**/
@:structInit
class CYMK {
    public var c = 0.; 
    public var y = 0.;
    public var m = 0.;
    public var k = 0.;
    public function new( c: Float, y: Float, m: Float, k: Float ){
        this.c = c; 
        this.y = y;
        this.m = m;
        this.k = k;
    }
}
