package pallette.nature;

enum abstract HairTones( Int ) to Int from Int {
    var midnightBlack =      0xFF090806;
    var offBlack =           0xFF2C222B;
    var darkestBrown =       0xFF383024;
    var medDarkBrown =       0xFF564B4F;
    var chestnutBrown =      0xFF504444;
    var lightChestnutBrown = 0xFF6A4E42;
    var darkGoldenBrown =    0xFF554838;
    var lightGoldenBrown =   0xFFA7856A;
    var darkHoneyBlonde =    0xFFB89778;
    var bleachedBlonde =     0xFFDCD0BA;
    var lightAshBlonde =     0xFFDEBC99;
    var lightAshBrown =      0xFF977961;
    var lightestBlonde =     0xFFE6CEA8;
    var paleGoldenBlonde =   0xFFE5C8A8;
    var strawberryBlonde =   0xFFA56B46;
    var lightAuburn =        0xFF91553D;
    var darkAuburn =         0xFF533D32;
    var darkestGrey =        0xFF71635A;
    var mediumGrey =         0xFFB7A69E;
    var lightGrey =          0xFFD6C4C2;
    var whiteBlonde =        0xFFFFF5E1;
    var platinumBlonde =     0xFFCABFB1;
    var russetRed =          0xFF8D4A43;
    var teraCutta =          0xFFB55239;
    
    var toastedWheat =       0xFFD8C078;
    var meltedButter =       0xFFe3cc88;
    var wheatMilk =          0xFFF2DA91;
    var cakeTwo =            0xFFF2E1AE;
    var poorJean =           0xFFF2E7C7;
    
    var mudOnShoe =          0xFF664F3C;
    var cookie =             0xFF8c684a;
    var treeBark =           0xFF332A22;
}
/**
   ![hairTone](../../bootstrap/img/hairTone.png)
**/
class HairTone{
    inline public static 
    function getColors (): Array<HairTones> {
        return  [ midnightBlack
                  , offBlack
                  , darkestBrown
                  , medDarkBrown
                  , chestnutBrown
                  , lightChestnutBrown
                  , darkGoldenBrown
                  , lightGoldenBrown
                  , darkHoneyBlonde
                  , bleachedBlonde
                  , lightAshBlonde
                  , lightAshBrown
                  , lightestBlonde
                  , paleGoldenBlonde
                  , strawberryBlonde
                  , lightAuburn
                  , darkAuburn
                  , darkestGrey
                  , mediumGrey
                  , lightGrey
                  , whiteBlonde
                  , platinumBlonde
                  , russetRed 
                  , teraCutta
                  , toastedWheat
                  , meltedButter
                  , wheatMilk
                  , cakeTwo
                  , poorJean
                  , mudOnShoe
                  , cookie
                  , treeBark ];
    }
    inline public static
    function random(): HairTones {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*31);
        return all[rnd];
    }
    inline public static
    function getName( s: HairTones ): String {
        return switch( s ){
            case midnightBlack:         'midnightBlack';
            case offBlack:              'offBlack';
            case darkestBrown:          'darkestBrown';
            case medDarkBrown:          'midDarkBrown';
            case chestnutBrown:         'chestnutBrown';
            case lightChestnutBrown:    'lightChestnutBrown';
            case darkGoldenBrown:       'darkGoldenBrown';
            case lightGoldenBrown:      'lightGoldenBrown';
            case darkHoneyBlonde:       'darkHoneyBlonde';
            case bleachedBlonde:        'bleachedBlonde';
            case lightAshBlonde:        'lightAshBlonde';
            case lightAshBrown:         'lightAshBrown';
            case lightestBlonde:        'lightestBlonde';
            case paleGoldenBlonde:      'paleGoldenBlonde';
            case strawberryBlonde:      'strawberryBlone';
            case lightAuburn:           'lightAuburn';
            case darkAuburn:            'darkAuburn';
            case darkestGrey:           'darkestGrey';
            case mediumGrey:            'mediumGrey';
            case lightGrey:             'lightGrey';
            case whiteBlonde:           'whiteBlonde';
            case platinumBlonde:        'platinumBlonde';
            case russetRed:             'russetRed';
            case teraCutta:             'teraCutta';
            
            case toastedWheat:          'toastedWheat';
            case meltedButter:          'meltedButter';
            case wheatMilk:             'wheatMilk';
            case cakeTwo:               'cakeTwo';
            case poorJean:              'poorJean';
    
            case mudOnShoe:             'mudOnShoe';
            case cookie:                'cookie';
            case treeBark:              'treeBark';
            
        }
    }
}