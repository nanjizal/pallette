package pallette.metal;

enum abstract Coppers( Int ) from Int to Int {
   var copperGreen       = 0xff679267;
   var patina            = 0xff639A8F;
   var verdigris         = 0xff43B3AE;
   var patinaLight       = 0xffAFD0CA;
   var copperYellow      = 0xffC9AE5D;
   var copperCream       = 0xffECD5C5;
   var copperOrange      = 0xffD99058;
   var paleCopper        = 0xffDA8A67;
   var copperRustLight   = 0xffCD9999;
   var copperRed         = 0xffCB6D51;
   var kenyanCopperLight = 0xffBF6935;
   var copperCanyonLight = 0xffC08D5E;
   var brilliantCopper   = 0xffB87B6B;
   var copper            = 0xffB87333;
   var copperBronze      = 0xffAE6938;
   var copperPenny       = 0xffAD6F69;
   var copperTan         = 0xffA87C6D;
   var copperRose        = 0xff956666;
   var copperRust        = 0xff944747;
   var cauldron          = 0xff882D17;
   var copperLustre      = 0xff80461B;
   var copperCanyon      = 0xff7E3A15;
   var kenyanCopper      = 0xff7C1C05;
   var copperLeaf        = 0xff79443B;
   var darkCopper        = 0xff71291D; 
}

/** 
   ![Copper](../../bootstrap/img/coppers.png)
**/
class Copper{
    inline public static 
    function getColors (): Array<Coppers> {
        return  [ 
              copperGreen
            , patina
            , verdigris
            , patinaLight
            , copperYellow
            , copperCream
            , copperOrange
            , paleCopper
            , copperRustLight
            , copperRed
            , kenyanCopperLight
            , copperCanyonLight
            , brilliantCopper
            , copper
            , copperBronze
            , copperPenny
            , copperTan
            , copperRose
            , copperRust
            , cauldron
            , copperLustre
            , copperCanyon
            , kenyanCopper
            , copperLeaf
            , darkCopper ];

    }
    inline public static
    function random(): Coppers {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*24);
        return all[rnd];
    }
    inline public static
    function getName( b: Coppers ): String {
        return switch( b ){
            case copperGreen:       'copperGreen';
            case patina:            'patina';
            case verdigris:         'verdigris';
            case patinaLight:       'patinaLight';
            case copperYellow:      'copperYellow';
            case copperCream:       'copperCream';
            case copperOrange:      'copperOrange';
            case paleCopper:        'paleCopper';
            case copperRustLight:   'copperRustLight';
            case copperRed:         'copperRed';
            case kenyanCopperLight: 'kenyanCopperLight';
            case copperCanyonLight: 'copperCanyonLight';
            case brilliantCopper:   'brilliantCopper';
            case copper:            'copper';
            case copperBronze:      'copperBronze';
            case copperPenny:       'copperPenny';
            case copperTan:         'copperTan';
            case copperRose:        'copperRose';
            case copperRust:        'copperRust';
            case cauldron:          'cauldron';
            case copperLustre:      'copperLustre';
            case copperCanyon:      'copperCanyon';
            case kenyanCopper:      'kenyanCopper';
            case copperLeaf:        'copperLeaf';
            case darkCopper:        'darkCopper';
        }
    }
}
