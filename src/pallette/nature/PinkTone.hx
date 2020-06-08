package pallette.nature;

enum abstract PinkTones( Int ) to Int from Int {
    var linen           = 0xFFFBEAE2;
    var cinderalla      = 0xFFFCE1D6;
    var apricot         = 0xFFFDD2C2;
    var waxFlower       = 0xFFFFC2AD;
    var manhattan       = 0xFFF5B399;
    var tonyPink        = 0xFFE39D7E;
    var copper          = 0xFFDB9073;
    var rawSienna       = 0xFFCE7A58;
    var brown           = 0xFFB1674A;
    var ironStone       = 0xFF7F4C3B;
}
/** 
   ![pinkTone](../../bootstrap/img/pinkTone.png)
**/
class PinkTone{
    inline public static 
    function getColors (): Array<PinkTones> {
        return  [ linen
                , cinderalla
                , apricot
                , waxFlower
                , manhattan
                , tonyPink
                , copper
                , rawSienna
                , brown
                , ironStone ];
    }
    inline public static
    function random(): PinkTones {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*9);
        return all[rnd];
    }
    inline public static
    function getName( s: PinkTones ): String {
        return switch( s ){
            case linen:         'linen';
            case cinderalla:    'cinderalla';
            case apricot:       'apricot';
            case waxFlower:     'waxFlower';
            case manhattan:     'manhattan';
            case tonyPink:      'tonePink';
            case copper:        'copper';
            case rawSienna:     'rawSienna';
            case brown:         'brown';
            case ironStone:     'ironStone';
        }
    }
}

