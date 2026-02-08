package pallette.utils;

import pallette.wheel.MartianColors;

/**
 * Named rotation steps for the 24-color Martian wheel.
 */
enum abstract MartianHarmony(Int) from Int to Int {
    var Complement = 12;      // 180°
    var Triadic = 8;          // 120°
    var Square = 6;           // 90°
    var SplitComplement = 10; // 150°
    var AnalogousPlus = 2;    // 30°
    var AnalogousMinus = -2;
}

/**
 * Discrete steps for brightness and saturation (approx 10% per step).
 */
enum abstract MartianStep(Int) from Int to Int {
    var Subtle = 1;  
    var Mid = 2;     
    var Heavy = 4;    
    var Extreme = 8;  
}

/**
 * A fluent abstract wrapper for any color (0xRRGGBB).
 * Provides artistic Martian transformations and perceptual debugging tools.
 */
abstract MartianInt(Int) from Int to Int to Int {
    
    public inline function new(i:Int) this = i;

    /** 
     * Snaps any random hex to its nearest Martian Hue AND its nearest 5% brightness step.
     */
    public static function fromAny(color:Int):MartianInt {
        var base:MartianInt = findNearest(color);
        var steps = base.findNearestBrightStep(color);
        return base.adjustBrightness(steps * 0.05);
    }

    /** 
     * Publicly find the closest Martian index for non-standard colors.
     */
    public static function findNearest(color:Int):MartianInt {
        var r1 = (color >> 16) & 0xFF;
        var g1 = (color >> 8) & 0xFF;
        var b1 = color & 0xFF;
        var minDistance:Float = 1e18; 
        var closestIndex:Int = 0;

        for (i in 0...24) {
            var m = MartianColors.getMartianColor(i);
            var dr = r1 - ((m >> 16) & 0xFF);
            var dg = g1 - ((m >> 8) & 0xFF);
            var db = b1 - (m & 0xFF);
            var dist = (dr * dr) + (dg * dg) + (db * db);
            if (dist < minDistance) {
                minDistance = dist;
                closestIndex = i;
            }
        }
        return new MartianInt(MartianColors.getMartianColor(closestIndex));
    }

    /** Rotates hue via Martian wheel indices. Handles foreign colors automatically. */
    public function getHarmony(harmony:MartianHarmony):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        if (idx == -1) idx = MartianColors.getColorIndex(findNearest(this));
        
        var next = (idx + (cast harmony)) % 24;
        if (next < 0) next += 24;
        return new MartianInt(MartianColors.getMartianColor(next));
    }

    /** 
     * Mutes the color by blending it with its 'Ideal' Perceptual Greyscale.
     * Keeps the perceptual 'weight' of the color while receding it into the background.
     */
    public function mute(step:MartianStep = Mid):MartianInt {
        var factor:Float = (cast step) * 0.1;
        var grey:MartianInt = toIdealGrey();
        
        var r1 = (this >> 16 & 0xFF), g1 = (this >> 8 & 0xFF), b1 = (this & 0xFF);
        var r2 = (grey >> 16 & 0xFF), g2 = (grey >> 8 & 0xFF), b2 = (grey & 0xFF);
        
        var r = Math.round(r1 + (r2 - r1) * factor);
        var g = Math.round(g1 + (g2 - g1) * factor);
        var b = Math.round(b1 + (b2 - b1) * factor);
        
        return new MartianInt((r << 16) | (g << 8) | b);
    }

    /** Converts color to a Luma-weighted 'Ideal' Greyscale. */
    public function toIdealGrey():MartianInt {
        var r = (this >> 16 & 0xFF), g = (this >> 8 & 0xFF), b = (this & 0xFF);
        var luma = Math.round((r * 0.299) + (g * 0.587) + (b * 0.114));
        return new MartianInt((luma << 16) | (luma << 8) | luma);
    }

    /** Perceptual contrast for text labels (Black/White). */
    public inline function contrast():MartianInt {
        var r = (this >> 16 & 0xFF), g = (this >> 8 & 0xFF), b = (this & 0xFF);
        var yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return new MartianInt(yiq >= 128 ? 0x000000 : 0xFFFFFF);
    }

    public inline function lighten(step:MartianStep = Mid):MartianInt return adjustBrightness((cast step) * 0.05);
    public inline function darken(step:MartianStep = Mid):MartianInt return adjustBrightness((cast step) * -0.05);

    public function findNearestBrightStep(target:Int):Int {
        var l1 = getLuminance(this);
        var l2 = getLuminance(target);
        return Math.round((l2 - l1) / 0.05);
    }

    public function adjustBrightness(amount:Float):MartianInt {
        var r = (this >> 16 & 0xFF) / 255.0, g = (this >> 8 & 0xFF) / 255.0, b = (this & 0xFF) / 255.0;
        var max = Math.max(r, Math.max(g, b)), min = Math.min(r, Math.min(g, b));
        var h:Float, s:Float, l:Float = (max + min) / 2;

        if (max == min) { h = s = 0; } else {
            var d = max - min;
            s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
            if (max == r) h = (g - b) / d + (g < b ? 6 : 0);
            else if (max == g) h = (b - r) / d + 2;
            else h = (r - g) / d + 4;
            h /= 6;
        }

        l = Math.max(0, Math.min(1, l + amount));
        function h2r(p:Float, q:Float, t:Float):Float {
            if (t < 0) t += 1; if (t > 1) t -= 1;
            if (t < 1/6) return p + (q - p) * 6 * t;
            if (t < 1/2) return q;
            if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
            return p;
        }
        var q = l < 0.5 ? l * (1 + s) : l + s - l * s, p = 2 * l - q;
        return new MartianInt((Math.round(h2r(p, q, h + 1/3) * 255) << 16) | (Math.round(h2r(p, q, h) * 255) << 8) | Math.round(h2r(p, q, h - 1/3) * 255));
    }

    private static function getLuminance(c:Int):Float {
        var r = (c >> 16 & 0xFF)/255, g = (c >> 8 & 0xFF)/255, b = (c & 0xFF)/255;
        return (Math.max(r, Math.max(g, b)) + Math.min(r, Math.min(g, b))) / 2;
    }

    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}


