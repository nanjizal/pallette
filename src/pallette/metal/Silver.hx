package pallette.metal;

enum abstract Silvers( Int ) to Int from Int {
    var platinum        = 0xffE5E4E2;
    var lavenderTint    = 0xffDADADA;
    var lightSilver     = 0xffD8D8D8;
    var paleSilver      = 0xffC9C0BB;
    var silverPink      = 0xffC4AEAD;
    var silver          = 0xffC0C0C0;
    var silverSand      = 0xffBFC1C2;
    var silverChalice   = 0xffACACAC;
    var quicksilver     = 0xffA6A6A6;
    var lightSirocco    = 0xffB8C2C2;
    var newSilver       = 0xffBFB8A5;
    var romanSilver     = 0xff838996;
    var sirocco         = 0xff818080;
    var oldSilver       = 0xff848482;
    var sonicSilver     = 0xff757575;
    var darkSilver      = 0xff71706E; 
}
/** 
   ![Silver](../../bootstrap/img/silver.png)
**/
class Silver{
    inline public static 
    function getColors (): Array<Silvers> {
        return  [ 
              platinum
            , lavenderTint
            , lightSilver
            , paleSilver
            , silverPink
            , silver
            , silverSand
            , silverChalice
            , quicksilver
            , lightSirocco
            , newSilver
            , romanSilver
            , sirocco
            , oldSilver
            , sonicSilver
            , darkSilver ];
    }
    inline public static
    function random(): Silvers {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*15);
        return all[rnd];
    }
    inline public static
    function getName( b: Silvers ): String {
        return switch( b ){
            case platinum:      'platinum';
            case lavenderTint:  'lavenderTint';
            case lightSilver:   'lightSilver';
            case paleSilver:    'paleSilver';
            case silverPink:    'silverPink';
            case silver:        'silver';
            case silverSand:    'silverSand';
            case silverChalice: 'silverChalice';
            case quicksilver:   'quicksilver';
            case lightSirocco:  'lightSirocco';
            case newSilver:     'newSilver';
            case romanSilver:   'romanSilver';
            case sirocco:       'sirocco';
            case oldSilver:     'oldSilver';
            case sonicSilver:   'sonicSilver';
            case darkSilver:    'darkSilver';
        }
    }
}
