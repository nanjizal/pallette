package pallette;

// source of hex numbers https://joekotlan.com/using-gold-color-web/, names found on google.
enum abstract Golds(Int) to Int from Int {
    var rolex            = 0xffA37E2C;
    var periniNavi       = 0xffD5A848;
    var crownRoyal       = 0xffE4B77D;
    var metallic         = 0xffD4AF37;
    var goldenYellow     = 0xffFFDF00;
    var poppy            = 0xffFCC200;
    var sunglow          = 0xffFFC627;
    var superNova        = 0xffFFCC00;
    var vividOrange      = 0xffFD8515;
    var pomona           = 0xffC6930A;
    var tangerineYellow  = 0xffFFd100;
    var saffron          = 0xffF1B82D;
    var newOrleans       = 0xffE6BE8A;
    var goldenDream      = 0xffFFCC33;
    var harvestEveGold   = 0xffDA9100;
    var chanterelle      = 0xffDAA520;
    var vegasGold        = 0xffC5B358;
    var satinSheenGold   = 0xffCBA135;
    var cobre            = 0xff996515;
}

class Gold {
    public static inline function gradient0(){
        return [ 0xffAE8625,0xffF7EF8A, 0xffD2AC47, 0xffEDC967 ];
    }
    public static inline function gradient1(){
        return [ 0xffDFBD69, 0xff926F34 ];
    }
    public static inline function gradient2(){
        return [ 0xffF9F295, 0xffE0AA3E, 0xffE0AA3E, 0xffB88A44 ]; // TODO: unsure on 2 and 3 entry as one should be light and other dark.
    }
    inline public static 
    function getColors (): Array<Gold> {
        return  [ rolex
                , periniNavi
                , crownRoyal
                , metallic
                , goldenYellow
                , poppy
                , sunglow
                , superNova
                , vividOrange
                , pomona
                , tangerineYellow
                , saffron
                , newOrleans
                , goldenDream
                , harvestEveGold
                , chanterelle
                , vegasGold
                , satinSheenGold
                , cobre ];
    }
    inline public static
    function random(): Golds {
        var all = getGolds();
        var rnd: Int = Math.round( Math.random()*18);
        return all[rnd];
    }
    
    inline public static
    function getName( g: Golds ): String {
        return switch( g ){
            case rolex:             'rolex';
            case periniNavi:        'periniNavi';
            case crownRoyal:        'crownRoyal';
            case metallic:          'metallic';
            case goldenYellow:      'goldenYellow';
            case poppy:             'poppy';
            case sunglow:           'sunglow';
            case superNova:         'superNova';
            case vividOrange:       'vividOrange';
            case pomona:            'pomona';
            case tangerineYellow:   'tangerineYellow';
            case saffron:           'saffron';
            case newOrleans:        'newOrleans';
            case goldenDream:       'goldenDream';
            case harvestEveGold:    'harvestEveGold';
            case chanterelle:       'chanterelle';
            case vegasGold:         'vegasGold';
            case satinSheenGold:    'satinSheenGold';
            case cobre:             'cobre';
        }
    }
}

// https://simple.wikipedia.org/wiki/Gold_(color)
enum abstract AllGolds( Int ) to Int from Int {
    var old_Lace            = 0xffFDF5E6;
    var linen               = 0xffFAF0E6;
    var cornsilk            = 0xffFFF8DC;
    var beige               = 0xffF5F5DC;
    //var lacyOmelette = 0xffFF56GD;
    var lemonChiffon        = 0xffFFFACD;
    var blond               = 0xffFAF0BE;
    var paleGoldenrod       = 0xffEEE8AA;
    var wheat               = 0xffF5DEB3;
    var lightCandlelight    = 0xffFEEF61;
    var maize               = 0xffFBEC5D;
    var lemonPeel           = 0xFDE910;
    var jasmine             = 0xffF8DE7E;
    var jonquil             = 0xffFADA5E;
    var dandelion           = 0xffFED85D;
    var mustard             = 0xffFFDB58;
    var mediumGoldenrod     = 0xffFCD667;
    var candlelight         = 0xffFCD917;
    var goldenYellow        = 0xffFFDF00;
    var schoolBusYellow     = 0xffFFD800;
    var golden              = 0xffFFD700;
    var lightCaliforniaGold = 0xffFFD230;
    var sunglow             = 0xffFFCC33;
    var tangerineYellow     = 0xffFFCC00;
    var saffron             = 0xffF4C430;
    var goldenPoppy         = 0xffFCC200;
    //var cheezWhiz = 0xff0F5DGH; // ??
    var selectiveYellow     = 0xffFFBA00;
    var missouriGold        = 0xffF1B82D;
    var macaroniAndCheese   = 0xffFFB79B;
    var sandyBrown          = 0xffF4A460;
    var desertSand          = 0xffEDC9AF;
    var paleGold            = 0xffE6BE8A;
    var lightBuddhaGold     = 0xffE4D430;
    var incaGold            = 0xffE3A857;
    var brightCaliforniaGold = 0xffFE9D04;
    var earthYellow         = 0xffE1A95F;
    var brass               = 0xffC3A368;
    var aztecGold           = 0xffC39953;
    var californiaGold      = 0xffA98F64;
    var vegasGold           = 0xffC5B356;
    var oldGold             = 0xffCFB53B;
    var metalicGold         = 0xffD4AF37;
    var goldenrod           = 0xffDAA520;
    var satinSheenGold      = 0xffCBA135;
    var buddhaGold          = 0xffC1A004;
    var pomonaGold          = 0xffC6930A;
    var califoniaGold       = 0xffB78727;
    var peru                = 0xffCD853F;
    var roseGold            = 0xffB76E79;
    var burntSienna         = 0xffE97451;
    var ochre               = 0xffCC7722;
    var pirateGold          = 0xffBA7827;
    var darkGoldenrod       = 0xffb8860B;
    var metallicSunburst    = 0xff9C7C3B;
    var goldFusion          = 0xff85754E;
    var sandyTaupe          = 0xff967117;
    var goldenBrown         = 0xff996515;
    var rawUmber            = 0xff734A12;
}

class AllGold {
    inline public static 
    function getColors (): Array<Gold> {
        return  [ 
              old_Lace
            , linen
            , cornsilk
            , beige
            , lemonChiffon
            , blond
            , paleGoldenrod
            , wheat
            , lightCandlelight
            , maize
            , lemonPeel
            , jasmine
            , jonquil
            , dandelion
            , mustard
            , mediumGoldenrod
            , candlelight
            , goldenYellow
            , schoolBusYellow
            , golden
            , lightCaliforniaGold
            , sunglow
            , tangerineYellow
            , saffron
            , goldenPoppy
            , selectiveYellow
            , missouriGold
            , macaroniAndCheese
            , sandyBrown
            , desertSand
            , paleGold
            , lightBuddhaGold
            , incaGold
            , brightCaliforniaGold
            , earthYellow
            , brass
            , aztecGold
            , californiaGold
            , vegasGold
            , oldGold
            , metalicGold
            , goldenrod
            , satinSheenGold
            , buddhaGold
            , pomonaGold
            , califoniaGold
            , peru
            , roseGold
            , burntSienna
            , ochre
            , pirateGold
            , darkGoldenrod
            , metallicSunburst
            , goldFusion
            , sandyTaupe
            , goldenBrown
            , rawUmber ];
    }
    inline public static
    function random(): Golds {
        var all = getAllGolds();
        var rnd: Int = Math.round( Math.random()*56);
        return all[rnd];
    }
    
    inline public static
    function getName( g: Golds ): String {
        return switch( g ){
            case old_Lace:              'old_Lace';
            case linen:                 'linen';
            case cornsilk:              'cornsilk';
            case beige:                 'beige';
            case lemonChiffon:          'lemonChiffon';
            case blond:                 'blond';
            case paleGoldenrod:         'paleGoldenrod';
            case wheat:                 'wheat';
            case lightCandlelight:      'lightCandlelight';
            case maize:                 'maize';
            case lemonPeel:             'lemonPeel';
            case jasmine:               'jasmine';
            case jonquil:               'jonquil';
            case dandelion:             'dandelion';
            case mustard:               'mustard';
            case mediumGoldenrod:       'mediumGoldenrod';
            case candlelight:           'candlelight';
            case goldenYellow:          'goldenYellow';
            case schoolBusYellow:       'schoolBusYellow';
            case golden:                'golden';
            case lightCaliforniaGold:   'lightCaliforniaGold';
            case sunglow:               'sunglow';
            case tangerineYellow:       'tangerineYellow';
            case saffron:               'saffron';
            case goldenPoppy:           'goldenPoppy';
            case selectiveYellow:       'selectiveYellow';
            case missouriGold:          'missouriGold';
            case macaroniAndCheese:     'macaroniAndCheese';
            case sandyBrown:            'sandyBrown';
            case desertSand:            'desertSand';
            case paleGold:              'paleGold';
            case lightBuddhaGold:       'lightBuddhaGold';
            case incaGold:              'incaGold';
            case brightCaliforniaGold:  'brightCalifoniaGold';
            case earthYellow:           'earthYellow';
            case brass:                 'brass';
            case aztecGold:             'aztecGold';
            case californiaGold:        'califoniaGold';
            case vegasGold:             'vegasGold';
            case oldGold:               'oldGold';
            case metalicGold:           'metalicGold';
            case goldenrod:             'goldenrod';
            case satinSheenGold:        'satinSheenGold';
            case buddhaGold:            'buddhaGold';
            case pomonaGold:            'pomonaGold';
            case califoniaGold:         'califoniaGold';
            case peru:                  'peru';
            case roseGold:              'roseGold';
            case burntSienna:           'burntSienna';
            case ochre:                 'ochre';
            case pirateGold:            'pirateGold';
            case darkGoldenrod:         'darkGoldenrod';
            case metallicSunburst:      'metallicSunburst';
            case goldFusion:            'goldFusion';
            case sandyTaupe:            'sandyTaupe';
            case goldenBrown:           'goldenBrown';
            case rawUmber:              'rawUmber';
        }
    }
}
