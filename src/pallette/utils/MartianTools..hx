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
 * Discrete steps for brightness adjustment (approx 5% per step).
 */
enum abstract MartianStep(Int) from Int to Int {
    var Subtle = 1;  
    var Mid = 2;     
    var Heavy = 4;    
    var Extreme = 8;  
}

/**
 * A fluent abstract wrapper for any color (0xRRGGBB).
 * Provides artistic Martian transformations and debugging tools.
 */
abstract MartianInt(Int) from Int to Int to Int {
    
    public inline function new(i:Int) this = i;

    /** 
     * Rotates hue via Martian wheel indices. 
     * If the color is not a native Martian color, it snaps to the nearest neighbor.
     */
    public function getHarmony(harmony:MartianHarmony):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        if (idx == -1) {
            var nearest:MartianInt = findNearest(this);
            idx = MartianColors.getColorIndex(nearest);
        }
        //if (idx == -1) idx = findNearestIndex(this);
        
        var next = (idx + (cast harmony)) % 24;
        if (next < 0) next += 24;
         return new MartianInt(MartianColors.getMartianColor(next));
    }

    /** Returns black or white based on perceptual luminance for debug labels */
    public inline function contrast():MartianInt {
        var r = (this >> 16 & 0xFF);
        var g = (this >> 8 & 0xFF);
        var b = (this & 0xFF);
        var yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return new MartianInt(yiq >= 128 ? 0x000000 : 0xFFFFFF);
    }

    /** Quick stepped darkening */
    public inline function darken(step:MartianStep = Mid):MartianInt {
        return adjustBrightness((cast step) * -0.05);
    }

    /** Quick stepped lightening */
    public inline function lighten(step:MartianStep = Mid):MartianInt {
        return adjustBrightness((cast step) * 0.05);
    }

    /** Core HSL-based brightness adjustment */
    public function adjustBrightness(amount:Float):MartianInt {
        var r = (this >> 16 & 0xFF) / 255.0;
        var g = (this >> 8 & 0xFF) / 255.0;
        var b = (this & 0xFF) / 255.0;

        var max = Math.max(r, Math.max(g, b));
        var min = Math.min(r, Math.min(g, b));
        var h:Float, s:Float, l:Float = (max + min) / 2;

        if (max == min) {
            h = s = 0;
        } else {
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

        var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        var p = 2 * l - q;
        var fr = Math.round(h2r(p, q, h + 1/3) * 255);
        var fg = Math.round(h2r(p, q, h) * 255);
        var fb = Math.round(h2r(p, q, h - 1/3) * 255);
        return new MartianInt((fr << 16) | (fg << 8) | fb);
    }

    /** Internal helper to find the closest Martian index for non-standard colors */
    public static function findNearestIndex(color:Int):Int {
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
        // Return as MartianInt to enable further transforms
        return new MartianInt(MartianColors.getMartianColor(closestIndex));
    }

    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}
