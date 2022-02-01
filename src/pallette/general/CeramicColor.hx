package pallette.general;
import pallette.utils.ColorHelper;
class CeramicColor {
  /**
     * list of all enums
     */
    inline public static 
    function getColors (): Array<CeramicRGB> {
      return [ NONE,WHITE,GRAY,BLACK,GREEN,LIME,YELLOW,ORANGE,RED,PURPLE,BLUE,BROWN,PINK,MAGENTA,CYAN
              ,CORNFLOWERBLUE,MEDIUMVIOLETRED,DEEPPINK,PALEVIOLETRED,HOTPINK,LIGHTPINK,DARKRED,FIREBRICK
              ,CRIMSON,INDIANRED,LIGHTCORAL,SALMON,DARKSALMON,LIGHTSALMON,ORANGERED,TOMATO,DARKORANGE
              ,CORAL,DARKKHAKI,GOLD,KHAKI,PEACHPUFF,PALEGOLDENROD,MOCCASIN,PAPAYAWHIP,LEMONCHIFFON,LIGHTYELLOW
              ,SIENNA,CHOCOLATE,PERU,TAN,DARKOLIVEGREEN,OLIVE,TEAL,TURQUOISE,NAVY,INDIGO,ORCHID,LAVENDER
              ,AZURE,IVORY,DIMGREY,SLATEGREY,SNOW];
    }
    /**
     * provides a random way to get a colour
     */
    inline public static
    function random(): CeramicRGB {
        var all = getColors();
        var rnd: Int = Math.round( Math.random()*(all.length+1));
        return all[rnd];
    }
    /**
     * allows you to query the enums
     */
    inline public static
    function getName( c: CeramicRGB ): String {
        return switch( c ){
          case NONE: 'NONE';
          case WHITE: 'WHITE';
          case GRAY: 'GRAY';
          case BLACK:'BLACK';
          case GREEN:'GREEN';
          case LIME: 'LIME':
          case YELLOW:'YELLOW';
          case ORANGE:'ORANGE';
          case RED: 'RED';
          case PURPLE: 'PURPLE';
          case BLUE: 'BLUE';
          case BROWN: 'BROWN';
          case PINK: 'PINK';
          case MAGENTA: 'MAGENTA';
          case CYAN: 'CYAN';
          case CORNFLOWERBLUE: 'CORNFLOWERBLUE';
          case MEDIUMVIOLETRED: 'MEDIUMVIOLETRED';
          case DEEPPINK: 'DEEPPINK';
          case PALEVIOLETRED: 'PALEVIOLETRED';
          case HOTPINK: 'HOTPINK';
          case LIGHTPINK: 'LIGHTPINK';
          case DARKRED: 'DARKRED';
          case FIREBRICK: 'FIREBRICK';
          case CRIMSON: 'CRIMSON';
          case INDIANRED: 'INDIANRED';
          case LIGHTCORAL: 'LIGHTCORAL';
          case SALMON: 'SALMON';
          case DARKSALMON: 'DARKSALMON';
          case LIGHTSALMON: 'LIGHTSALMON';
          case ORANGERED: 'ORANGERED';
          case TOMATO: 'TOMATO';
          case DARKORANGE: 'DARKORANGE';
          case CORAL: 'CORAL';
          case DARKKHAKI: 'DARKKHAKI';
          case GOLD: 'GOLD';
          case KHAKI: 'KHAKI';
          case PEACHPUFF: 'PEACHPUFF';
          case PALEGOLDENROD: 'PALEGOLDENROD';
          case MOCCASIN: 'MOCCASIN';
          case PAPAYAWHIP: 'PAPAYAWHIP';
          case LEMONCHIFFON: 'LEMONCHIFFON';
          case LIGHTYELLOW: 'LIGHTYELLOW';
          case SIENNA: 'SIENNA';
          case CHOCOLATE: 'CHOCOLATE';
          case PERU: 'PERU';
          case TAN: 'TAN';
          case DARKOLIVEGREEN: 'DARKOLVIEGREEN';
          case OLIVE: 'OLIVE';
          case TEAL: 'TEAL';
          case TURQUOISE: 'TURQUOISE';
          case NAVY: 'NAVY';
          case INDIGO: 'INDIGO';
          case ORCHID: 'ORCHID';
          case LAVENDER: 'LAVENDER';
          case AZURE: 'AZURE';
          case IVORY: 'IVORY';
          case DIMGREY: 'DIMGREY';
          case SLATEGREY: 'SLATEGREY';
          case SNOW: 'SNOW';
          ];
    }
}
// Added Colors used in ceramic but abstract enum form in this library file.
// https://github.com/ceramic-engine/ceramic/blob/master/runtime/src/ceramic/Color.hx
enum abstract CeramicRGB( Int ) to Int from Int {  
  var NONE =            -1;
  var WHITE =           0xFFFFFF;
  var GRAY =            0x808080;
  var BLACK =           0x000000;
  var GREEN =           0x008000;
  var LIME =            0x00FF00;
  var YELLOW =          0xFFFF00;
  var ORANGE =          0xFFA500;
  var RED =             0xFF0000;
  var PURPLE =          0x800080;
  var BLUE  =           0x0000FF;
  var BROWN =           0x8B4513;
  var PINK =            0xFFC0CB;
  var MAGENTA =         0xFF00FF;
  var CYAN =            0x00FFFF;
  var CORNFLOWERBLUE =  0x6495ED;
  var MEDIUMVIOLETRED = 0xC71585;
  var DEEPPINK =        0xFF1493;
  var PALEVIOLETRED =   0xDB7093;
  var HOTPINK =         0xFF69B4;
  var LIGHTPINK =       0xFFB6C1;
  var DARKRED =         0x8B0000;
  var FIREBRICK =       0xB22222;
  var CRIMSON =         0xDC143C;
  var INDIANRED =       0xCD5C5C;
  var LIGHTCORAL =      0xF08080;
  var SALMON =          0xFA8072;
  var DARKSALMON =      0xE9967A;
  var LIGHTSALMON =     0xFFA07A;
  var ORANGERED =       0xFF4500;
  var TOMATO =          0xFF6347;
  var DARKORANGE =      0xFF8C00;
  var CORAL =           0xFF7F50;
  var DARKKHAKI =       0xBDB76B;
  var GOLD =            0xFFD700;
  var KHAKI =           0xF0E68C;
  var PEACHPUFF =       0xFFDAB9;
  var PALEGOLDENROD =   0xEEE8AA;
  var MOCCASIN =        0xFFE4B5;
  var PAPAYAWHIP =      0xFFEFD5;
  var LEMONCHIFFON =    0xFFFACD;
  var LIGHTYELLOW =     0xFFFFE0;
  var SIENNA =          0xA0522D;
  var CHOCOLATE =       0xD2691E;
  var PERU =            0xCD853F;
  var TAN =             0xD2B48C;
  var DARKOLIVEGREEN =  0x556B2F;
  var OLIVE =           0x808000;
  var TEAL =            0x008080;
  var TURQUOISE =       0x40E0D0;
  var NAVY =            0x000080;
  var INDIGO =          0x4B0082;
  var ORCHID =          0xDA70D6;
  var LAVENDER =        0xE6E6FA;
  var AZURE =           0xF0FFFF;
  var IVORY =           0xFFFFF0;
  var DIMGREY =         0x696969;
  var SLATEGREY =       0x708090;
  var SNOW =            0xFFFAFA;
}
