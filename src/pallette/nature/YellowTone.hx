package pallette.nature;

enum abstract YellowTones( Int ) to Int from Int {
    var linen2 =        0xFFF8EBDB;
    var oasis  =        0xFFFDE5CD;
    var lightApricot =  0xFFFDD5B1;
    var manhatten2 =    0xFFF3C79A;
    var tumbleweed =    0xFFE2AF82;
    var wiskey =        0xFFD39E69;
    var muddyWaters =   0xFFB88A58;
    var dirt =          0xFF997249;
    var pottersClay =   0xFF805737;
    var spice =         0xFF68492D;
}
/** 
   ![yellowTone](../../bootstrap/img/yellowTone.png)
**/
class YellowTone{
    inline public static 
    function getColors (): Array<YellowTones> {
        return  [ linen2
                , oasis
                , lightApricot
                , manhatten2
                , tumbleweed
                , wiskey
                , muddyWaters
                , dirt
                , pottersClay
                , spice ];
    }
    inline public static
    function random(): YellowTones {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*9);
        return all[rnd];
    }
    inline public static
    function getName( s: YellowTones ): String {
        return switch( s ){
            case linen2:        'linen2';
            case oasis:         'oasis';
            case lightApricot:  'lightApricot';
            case manhatten2:    'manhatten2';
            case tumbleweed:    'tumbleweed';
            case wiskey:        'wiskey';
            case muddyWaters:   'muddyWaters';
            case dirt:          'dirt';
            case pottersClay:   'pottersClay';
            case spice:         'spice';
        }
    }
}