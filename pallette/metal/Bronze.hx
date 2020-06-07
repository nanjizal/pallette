package pallette;

abstract enum Bronzes( Int ) from Int to Int {
    var bronzeGold     = 0xffC9AE5D;
    var bronze         = 0xffCD7F32;
    var blastOffBronze = 0xffA57164;
    var deepBronze     = 0xff8C7853;
    var mediumBronze   = 0xff6C541E;
    var antiqueBronze  = 0xff665D1E;
    var darkBronze     = 0xff52503C; 
}

class Bronze{
    inline public static 
    function getBronzes (): Array<Bronzes> {
        return  [ bronzeGold
                , bronze
                , blastOffBronze
                , deepBronze
                , mediumBronze
                , antiqueBronze ];
    }
    inline public static
    function random(): Bronzes {
        var all = getBronzes();
        var rnd: Int = Math.round( Math.random()*5);
        return all[rnd];
    }
    inline public static
    function getName( b: Bronzes ): String {
        return switch( b ){
            case: bronzeGold:       'bronzeGold';
            case: bronze:           'bronze';
            case: blastOffBronze:   'blastOffBronze';
            case: deepBronze:       'deepBronze';
            case: mediumBronze:     'mediumBronze'; 
            case: antiqueBronze:    'antiqueBronze';
        }
    }
}
