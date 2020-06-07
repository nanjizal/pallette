package pallette.random;

// Pride flag colors, note Hot pink is not always used
enum abstract Pride( Int ) to Int from Int {
      var hotPink        = 0xFFff69b4;
      var red            = 0xFFFF0000;
      var pizzaz         = 0xFFff8e00;
      var yellow         = 0xFFFFFF00;
      var japaneseLaurel = 0xFF008e00;
      var eggBlue        = 0xFF00c0c0;
      var pigmentIndigo  = 0xff400098;
      var darkMagenta    = 0xFF8e008e;
}
/** 
   ![prideFlag](../../bootstrap/img/pride.png)
**/
class PrideFlag{
    inline public static 
    function getColors (): Array<Pride> {
        return  [ hotPink
                , red
                , pizzaz
                , yellow
                , japaneseLaurel
                , eggBlue
                , pigmentIndigo
                , darkMagenta ];
    }
    inline public static
    function random(): Pride {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*7);
        return all[rnd];
    }
    inline public static
    function getName( s: Pride ): String {
        return switch( s ){
            case hotPink:       'hotPink';
            case red:           'red';
            case pizzaz:        'pizzaz';
            case yellow:        'yellow';
            case japaneseLaurel:'japaneseLaurel'; 
            case eggBlue:       'eggBlue';
            case pigmentIndigo: 'pigmentIndigo';
            case darkMagenta:   'darkMagenta';
        }
    }
}
