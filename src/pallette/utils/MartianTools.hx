package pallette.utils;

import pallette.wheel.MartianColours;

enum abstract MartianCVD(Int) {
    var Protanomaly = 0; var Protanopia = 1; var Deuteranomaly = 2; 
    var Deuteranopia = 3; var Tritanopia = 4; var Achromatopsia = 5;
}

enum abstract MartianHarmony(Int) {
    var Complement = 12; // 180 deg
    var Triad1 = 8;      // 120 deg
    var Triad2 = 16;     // 240 deg
    var Analogous = 2;   // 30 deg
}

/** 
 * Maps directly to your 5-item arrays in MartianColours.
 */
enum abstract MartianStep(Float) from Float to Float {
    var Pale = 0.1;   // Index 0
    var Light = 0.3;  // Index 1
    var Mid = 0.5;    // Index 2 (Pure)
    var Deep = 0.7;   // Index 3
    var Dark = 0.9;   // Index 4
}

abstract MartianInt(Int) from Int to Int to Int {
    public inline function new(i:Int) this = i;

    /** 
     * Finds the nearest 24-sector index for any color. 
     */
    public function getSection():Int {
        var r1 = (this >> 16 & 0xFF), g1 = (this >> 8 & 0xFF), b1 = (this & 0xFF);
        var min:Float = 1e18, best:Int = 0;
        for (i in 0...24) {
            var m = MartianColours.getColor(i * (Math.PI / 12), 0.5);
            var d = Math.pow(r1 - (m >> 16 & 0xFF), 2) + Math.pow(g1 - (m >> 8 & 0xFF), 2) + Math.pow(b1 - (m & 0xFF), 2);
            if (d < min) { min = d; best = i; }
        }
        return best;
    }

    /** 
     * Rotates hue and sets strength. 
     * Example: base.getHarmony(Complement, Dark)
     */
    public function getHarmony(h:MartianHarmony, s:MartianStep = Mid):MartianInt {
        var rad = (getSection() + (cast h)) * (Math.PI / 12);
        return new MartianInt(MartianColours.getColor(rad, s));
    }

    /** Returns current hue at a different depth level (0-4) */
    public function atStrength(s:MartianStep):MartianInt {
        return new MartianInt(MartianColours.getColor(getSection() * (Math.PI / 12), s));
    }

    /** High Impact: Dark Warm vs Light Cool */
    public function getPowerPair():MartianInt {
        return getHarmony(Complement, getLuma() < 0.5 ? Pale : Dark);
    }

    /** CVD-Safe: shifts hue away from Red/Green danger zones. */
    public function getSafeBridge(bg:MartianInt):MartianInt {
        var sec = getSection();
        if ((sec >= 22 || sec <= 2) || (sec >= 6 && sec <= 10)) sec = (sec + 6) % 24;
        var safe = new MartianInt(MartianColours.getColor(sec * (Math.PI / 12), 0.5));
        return (Math.abs(safe.getLuma() - bg.getLuma()) < 0.3) ? (bg.getLuma() < 0.5 ? safe.atStrength(Pale) : safe.atStrength(Dark)) : safe;
    }

    public function simulateCVD(type:MartianCVD):MartianInt {
        var r = (this >> 16 & 0xFF), g = (this >> 8 & 0xFF), b = (this & 0xFF);
        var nr:Float, ng:Float, nb:Float;
        switch(type) {
            case Protanomaly: nr = r*0.817+g*0.183; ng = r*0.333+g*0.667; nb = b;
            case Protanopia:  nr = r*0.567+g*0.433; ng = r*0.558+g*0.442; nb = g*0.242+b*0.758;
            case Deuteranomaly: nr = r*0.800+g*0.200; ng = r*0.258+g*0.742; nb = b;
            case Deuteranopia:  nr = r*0.625+g*0.375; ng = r*0.700+g*0.300; nb = g*0.300+b*0.700;
            case Tritanopia:    nr = r*0.950+g*0.050; ng = g*0.433+b*0.567; nb = g*0.475+b*0.525;
            case Achromatopsia: return toIdealGrey();
        }
        return new MartianInt((Math.round(Math.min(255, nr)) << 16) | (Math.round(Math.min(255, ng)) << 8) | Math.round(Math.min(255, nb)));
    }

    public function toIdealGrey():MartianInt {
        var l = Math.round((this >> 16 & 0xFF) * 0.299 + (this >> 8 & 0xFF) * 0.587 + (this & 0xFF) * 0.114);
        return new MartianInt((l << 16) | (l << 8) | l);
    }

    public inline function contrast():MartianInt {
        return (getLuma() >= 0.5) ? 0x000000 : 0xFFFFFF;
    }

    public inline function getLuma():Float {
        return ((this >> 16 & 0xFF) * 0.299 + (this >> 8 & 0xFF) * 0.587 + (this & 0xFF) * 0.114) / 255;
    }

    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}
