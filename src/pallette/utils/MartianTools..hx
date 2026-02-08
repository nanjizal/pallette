package pallette.utils;

import pallette.wheel.MartianColors;

/** Real-world color vision deficiency types. */
enum abstract MartianCVD(Int) {
    var Protanomaly = 0; var Protanopia = 1; var Deuteranomaly = 2; 
    var Deuteranopia = 3; var Tritanopia = 4; var Achromatopsia = 5;
}

/** Named rotation steps for the 24-color Martian wheel. */
enum abstract MartianHarmony(Int) from Int to Int {
    var Complement = 12; var Triadic = 8; var Square = 6; 
    var SplitComplement = 10; var Analogous = 2;
}

/** Discrete 5% steps for brightness and saturation. */
enum abstract MartianStep(Int) from Int to Int {
    var Subtle = 1; var Mid = 2; var Heavy = 4; var Extreme = 8;  
}

/**
 * Fluent abstract for perceptual and artistic color transforms.
 * Specifically optimized for high-impact spatial debugging.
 */
abstract MartianInt(Int) from Int to Int to Int {
    public inline function new(i:Int) this = i;

    /** Maps any hex to nearest Martian Hue and Brightness step. */
    public static function fromAny(color:Int):MartianInt {
        var base = findNearest(color);
        return base.adjustBrightness(base.findNearestBrightStep(color) * 0.05);
    }

    /** Find closest Martian index for non-standard colors. */
    public static function findNearest(color:Int):MartianInt {
        var r1 = (color >> 16) & 0xFF, g1 = (color >> 8) & 0xFF, b1 = color & 0xFF;
        var min:Float = 1e18, idx:Int = 0;
        for (i in 0...24) {
            var m = MartianColors.getMartianColor(i);
            var dr = r1 - (m >> 16 & 0xFF), dg = g1 - (m >> 8 & 0xFF), db = b1 - (m & 0xFF);
            var d = (dr * dr) + (dg * dg) + (db * db);
            if (d < min) { min = d; idx = i; }
        }
        return new MartianInt(MartianColors.getMartianColor(idx));
    }

    /** Returns an array for 'Neon' rendering: [Core, Glow, MutedOuter] */
    public function getGlow():Array<MartianInt> {
        return [
            this.lighten(Mid),    // Sharp Core
            this,                 // Natural Glow
            this.darken(Mid).mute(Heavy) // Receding outer glow
        ];
    }
    
    /** 
     * Default Power Pair (180° rotation with auto-flip).
     * If you want to force a direction, just chain .lighten() or .darken() instead.
     */
    public function getPowerPair(step:MartianStep = Heavy):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        if (idx == -1) idx = MartianColors.getColorIndex(findNearest(this));
        
        var impact = new MartianInt(MartianColors.getMartianColor((idx + 12) % 24));
        
        // Auto-logic: if base is dark, return lightened version of the opposite
        return (getLuma(this) < 0.5) ? impact.lighten(step) : impact.darken(step);
    }

    /** CVD-Safe: avoids Red/Green axis and enforces 30% luminance gap. */
    public function getSafeBridge(background:MartianInt):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        if (idx == -1) idx = MartianColors.getColorIndex(findNearest(this));
        if ((idx >= 22 || idx <= 2) || (idx >= 6 && idx <= 10)) idx = (idx + 6) % 24;
        var safe = new MartianInt(MartianColors.getMartianColor(idx));
        var diff = getLuma(safe) - getLuma(background);
        return (Math.abs(diff) < 0.3) ? (getLuma(background) < 0.5 ? safe.lighten(Heavy) : safe.darken(Heavy)) : safe;
    }

    /** Simulates real-world CVD using confusion matrices. */
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

    public inline function getHarmony(h:MartianHarmony):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        if (idx == -1) idx = MartianColors.getColorIndex(findNearest(this));
        return new MartianInt(MartianColors.getMartianColor((idx + (cast h)) % 24));
    }

    public inline function lighten(s:MartianStep = Mid):MartianInt return adjustBrightness((cast s) * 0.05);
    public inline function darken(s:MartianStep = Mid):MartianInt return adjustBrightness((cast s) * -0.05);

    public function mute(s:MartianStep = Mid):MartianInt {
        var f = (cast s) * 0.1, g = toIdealGrey();
        var r = Math.round((this >> 16 & 0xFF) + ((g >> 16 & 0xFF) - (this >> 16 & 0xFF)) * f);
        var gr = Math.round((this >> 8 & 0xFF) + ((g >> 8 & 0xFF) - (this >> 8 & 0xFF)) * f);
        var b = Math.round((this & 0xFF) + ((g & 0xFF) - (this & 0xFF)) * f);
        return new MartianInt((r << 16) | (gr << 8) | b);
    }

    public function toIdealGrey():MartianInt {
        var l = Math.round((this >> 16 & 0xFF) * 0.299 + (this >> 8 & 0xFF) * 0.587 + (this & 0xFF) * 0.114);
        return new MartianInt((l << 16) | (l << 8) | l);
    }

    public inline function contrast():MartianInt {
        var yiq = ((this >> 16 & 0xFF) * 299 + (this >> 8 & 0xFF) * 587 + (this & 0xFF) * 114) / 1000;
        return new MartianInt(yiq >= 128 ? 0x000000 : 0xFFFFFF);
    }

    public function findNearestBrightStep(t:Int):Int return Math.round((getLuma(t) - getLuma(this)) / 0.05);

    public function adjustBrightness(amt:Float):MartianInt {
        var r=(this >> 16 & 0xFF)/255, g=(this >> 8 & 0xFF)/255, b=(this & 0xFF)/255;
        var max=Math.max(r, Math.max(g, b)), min=Math.min(r, Math.min(g, b));
        var h:Float, s:Float, l:Float=(max+min)/2;
        if(max==min) h=s=0; else {
            var d=max-min; s=l>0.5?d/(2-max-min):d/(max+min);
            if(max==r) h=(g-b)/d+(g<b?6:0); else if(max==g) h=(b-r)/d+2; else h=(r-g)/d+4;
            h/=6;
        }
        l=Math.max(0, Math.min(1, l+amt));
        function h2r(p:Float, q:Float, t:Float):Float {
            if(t<0) t+=1; if(t>1) t-=1;
            if(t<1/6) return p+(q-p)*6*t; if(t<1/2) return q; if(t<2/3) return p+(q-p)*(2/3-t)*6;
            return p;
        }
        var q=l<0.5?l*(1+s):l+s-l*s, p=2*l-q;
        return new MartianInt((Math.round(h2r(p,q,h+1/3)*255)<<16)|(Math.round(h2r(p,q,h)*255)<<8)|Math.round(h2r(p,q,h-1/3)*255));
    }

    static inline function getLuma(c:Int):Float return ((c >> 16 & 0xFF) * 0.299 + (c >> 8 & 0xFF) * 0.587 + (c & 0xFF) * 0.114) / 255;
    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}
