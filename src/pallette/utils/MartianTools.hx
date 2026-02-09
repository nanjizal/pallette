
package pallette.utils;

import pallette.wheel.MartianColors;

/** Real-world color vision deficiency simulation types. */
enum abstract MartianCVD(Int) {
    var Protanomaly = 0; var Protanopia = 1; var Deuteranomaly = 2; 
    var Deuteranopia = 3; var Tritanopia = 4; var Achromatopsia = 5;
}

/** Named rotation steps based on 24 sections (PI/12 per sector). */
enum abstract MartianHarmony(Int) from Int to Int {
    var Complement = 12;      // 180°
    var Triadic = 8;          // 120°
    var Square = 6;           // 90°
    var SplitComplement = 10; // 150°
    var Analogous = 2;        // 30°
}

/** 
 * Maps directly to the 5-item arrays in MartianColours.
 * Index = Std.int(strength * 5).
 */
enum abstract MartianStep(Float) from Float to Float {
    var Pale = 0.1;   // Index 0 (e.g. chickenBreast)
    var Light = 0.3;  // Index 1 (e.g. paleRaspberry)
    var Mid = 0.5;    // Index 2 (The Pure Martian color)
    var Deep = 0.7;   // Index 3 (e.g. darkRed)
    var Dark = 0.9;   // Index 4 (e.g. marron)
}

/**
 * Fluent abstract for the 2D Martian Wheel (Radian/Strength).
 * Optimized for high-impact spatial debugging (mortonhx).
 */
abstract MartianInt(Int) from Int to Int to Int {
    public inline function new(i:Int) this = i;

    /** Maps any random hex to the closest Martian Hue and matching brightness step. */
    public static function fromAny(color:Int):MartianInt {
        var base = findNearest(color);
        var steps = base.findNearestBrightStep(color);
        return base.adjustBrightness(steps * 0.05);
    }

    /** Scans the 24 wheel sections at 'Mid' strength to find the closest Martian hue. */
    public static function findNearest(color:Int):MartianInt {
        var r1 = (color >> 16) & 0xFF, g1 = (color >> 8) & 0xFF, b1 = color & 0xFF;
        var min:Float = 1e18, bestRad:Float = 0;
        for (i in 0...24) {
            var rad = i * (Math.PI / 12);
            var m = MartianColours.getColor(rad, 0.5); 
            var dr = r1 - (m >> 16 & 0xFF), dg = g1 - (m >> 8 & 0xFF), db = b1 - (m & 0xFF);
            var d = (dr * dr) + (dg * dg) + (db * db);
            if (d < min) { min = d; bestRad = rad; }
        }
        return new MartianInt(MartianColours.getColor(bestRad, 0.5));
    }

    /** Returns [Light, Pure, Dark] variations of the hue for neon/glow rendering effects. */
   //public function getGlow():Array<MartianInt> {
    //    return [this.atStrength(Light), this, this.atStrength(Dark).mute(Heavy)];
    //}

    /** Rotates hue across Martian sectors (1 section = PI/12 radians). */
    public function getHarmony(h:MartianHarmony, s:MartianStep = Mid):MartianInt {
        var rad = findNearestRadian() + (cast h) * (Math.PI / 12);
        return new MartianInt(MartianColours.getColor(rad, s));
    }

    /** Returns the artistic opposite at high-contrast strength (Pale vs Dark). */
    public function getPowerPair(s:MartianStep = Dark):MartianInt {
        var oppRad = findNearestRadian() + Math.PI;
        var isDark = getLuma() < 0.5;
        return new MartianInt(MartianColours.getColor(oppRad, isDark ? 0.1 : 0.9));
    }

    /** Hue-shifts away from Red/Green danger zones and enforces a 30% luminance gap. */
    public function getSafeBridge(background:MartianInt):MartianInt {
        var rad = findNearestRadian();
        var sec = Std.int(rad / (Math.PI / 12));
        if ((sec >= 22 || sec <= 2) || (sec >= 6 && sec <= 10)) rad += (Math.PI / 2);
        var safe = new MartianInt(MartianColours.getColor(rad, 0.5));
        var diff = safe.getLuma() - background.getLuma();
        return (Math.abs(diff) < 0.3) ? (background.getLuma() < 0.5 ? safe.atStrength(Pale) : safe.atStrength(Dark)) : safe;
    }

    /** Picks one of the 5 specific color variants within the current Martian hue array. */
    public function atStrength(s:MartianStep):MartianInt {
        return new MartianInt(MartianColours.getColor(findNearestRadian(), s));
    }

    /** Simulates color appearance for CVD users via confusion matrices. */
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

    /** Blends color with its Luma-weighted grey to 'recede' it without losing visual weight. */
    public function mute(s:MartianStep = Mid):MartianInt {
        var f = (cast s) * 0.1, g = toIdealGrey();
        var r = Math.round((this >> 16 & 0xFF) + ((g >> 16 & 0xFF) - (this >> 16 & 0xFF)) * f);
        var gr = Math.round((this >> 8 & 0xFF) + ((g >> 8 & 0xFF) - (this >> 8 & 0xFF)) * f);
        var b = Math.round((this & 0xFF) + ((g & 0xFF) - (this & 0xFF)) * f);
        return new MartianInt((r << 16) | (gr << 8) | b);
    }

    /** Converts color to its perceptual (Luma) grayscale value. */
    public function toIdealGrey():MartianInt {
        var l = Math.round((this >> 16 & 0xFF) * 0.299 + (this >> 8 & 0xFF) * 0.587 + (this & 0xFF) * 0.114);
        return new MartianInt((l << 16) | (l << 8) | l);
    }

    /** Returns black or white depending on current Luma for text legibility. */
    public inline function contrast():MartianInt {
        var yiq = ((this >> 16 & 0xFF) * 299 + (this >> 8 & 0xFF) * 587 + (this & 0xFF) * 114) / 1000;
        return new MartianInt(yiq >= 128 ? 0x000000 : 0xFFFFFF);
    }

    /** Finds distance to a target color in 5% brightness increments. */
    public function findNearestBrightStep(t:Int):Int return Math.round((getLumaFromInt(t) - getLuma()) / 0.05);

    /** Standard HSL lightness adjustment for generic tinting/shading. */
    public function adjustBrightness(amt:Float):MartianInt {
        var r=(this >> 16 & 0xFF)/255, g=(this >> 8 & 0xFF)/255, b=(this & 0xFF)/255;
        var max=Math.max(r, Math.max(g, b)), min=Math.min(r, Math.min(g, b));
        var h:Float, s:Float, l:Float=(max+min)/2;
        if(max==min) h=s=0; else {
            var d=max-min; s=l>0.5?d/(2-max-min):d/(max+min);
            if(max==r) h=(g-b)/d+(g<b?6:0); else if(max==g) h=(b-r)/d+2; else h=(r-g)/d+4; h/=6;
        }
        l = Math.max(0, Math.min(1, l + amt));
        function h2r(p:Float, q:Float, t:Float):Float {
            if(t<0) t+=1; if(t>1) t-=1;
            if(t<1/6) return p+(q-p)*6*t; if(t<1/2) return q; if(t<2/3) return p+(q-p)*(2/3-t)*6;
            return p;
        }
        var q=l<0.5?l*(1+s):l+s-l*s, p=2*l-q;
        return new MartianInt((Math.round(h2r(p,q,h+1/3)*255)<<16)|(Math.round(h2r(p,q,h)*255)<<8)|Math.round(h2r(p,q,h-1/3)*255));
    }

    /** Internal section lookup for non-standard hex inputs. */
    private function findNearestRadian():Float {
        var r1 = (this >> 16) & 0xFF, g1 = (this >> 8) & 0xFF, b1 = this & 0xFF;
        var min:Float = 1e18, bestRad:Float = 0;
        for (i in 0...24) {
            var rad = i * (Math.PI / 12);
            var m = MartianColours.getColor(rad, 0.5); 
            var dr = r1 - (m >> 16 & 0xFF), dg = g1 - (m >> 8 & 0xFF), db = b1 - (m & 0xFF);
            var d = (dr * dr) + (dg * dg) + (db * db);
            if (d < min) { min = d; bestRad = rad; }
        }
        return bestRad;
    }

    public inline function getLuma():Float return getLumaFromInt(this);
    static inline function getLumaFromInt(c:Int):Float return ((c >> 16 & 0xFF) * 0.299 + (c >> 8 & 0xFF) * 0.587 + (c & 0xFF) * 0.114) / 255;
    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}
