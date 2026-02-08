package pallette.utils;

import pallette.wheel.MartianColors;

/**
 * Named rotation steps for the 24-color Martian wheel.
 * 12 steps = 180° (Complement)
 */
enum abstract MartianHarmony(Int) from Int to Int {
    var Complement = 12;
    var Triadic = 8;
    var Square = 6;
    var SplitComplement = 10;
    var AnalogousPlus = 2;
    var AnalogousMinus = -2;
}

/**
 * Discrete steps for brightness adjustment.
 * Positive = Lighter (Tints), Negative = Darker (Shades)
 */
enum abstract MartianStep(Int) from Int to Int {
    var Subtle = 1;  // ~5%
    var Mid = 2;     // ~10%
    var Heavy = 4;    // ~20%
    var Extreme = 8;  // ~40%
}

/**
 * Fluent abstract for debugging spatial structures like Mortonhx.
 * Mixes Martian wheel rotation with HSL-based brightness scaling.
 */
abstract MartianInt(Int) from Int to Int to Int {
    public inline function new(i:Int) this = i;

    /** Rotates hue via Martian wheel indices (0-23) */
    public function getHarmony(harmony:MartianHarmony):MartianInt {
        var idx = MartianColors.getColorIndex(this);
        var next = (idx + (cast harmony)) % 24;
        if (next < 0) next += 24;
        return MartianColors.getMartianColor(next);
    }

    /** Quick stepped darkening (e.g. for grid lines or depth) */
    public inline function darken(step:MartianStep = Mid):MartianInt {
        return adjustBrightness((cast step) * -0.05);
    }

    /** Quick stepped lightening (e.g. for highlights) */
    public inline function lighten(step:MartianStep = Mid):MartianInt {
        return adjustBrightness((cast step) * 0.05);
    }

    /** Returns black or white based on perceptual luminance for labels */
    public inline function contrast():MartianInt {
        var r = (this >> 16 & 0xFF);
        var g = (this >> 8 & 0xFF);
        var b = (this & 0xFF);
        // YIQ Luminance formula
        var yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return (yiq >= 128) ? 0x000000 : 0xFFFFFF;
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
        return (fr << 16) | (fg << 8) | fb;
    }

    public inline function toHex():String return "0x" + StringTools.hex(this, 6);
}
