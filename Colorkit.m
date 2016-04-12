//
//  Colorkit.m
//
//  Created by Pierre Boumal
//  The MIT Licence (MIT)
//  Copyright (c) 2014 Pierre Boumal pixelslip@gmail.com
//

#import <math.h>
#import "Colorkit.h"

@implementation UIColor (Colorkit)

#pragma mark - Class methods
+(instancetype)colorWithHexString:(NSString *)hexString
{
    return [[self class] colorWithHexString:hexString alpha:1.0];
}

+(instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    int redColor, greenColor, blueColor;
    unsigned hex;
    
    hexString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    // Convert hexString if length == 3 (#354 == #335544)
    hexString = [[self class] convertHEXString:hexString];
    
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]];
    
    if(![scanner scanHexInt:&hex]) {
        return nil;
    }
    
    redColor   = (hex & 0xFF0000) >> 16;
    greenColor = (hex & 0xFF00) >> 8;
    blueColor  = (hex & 0xFF);
    
    return [UIColor colorWithRed:redColor / 255.0f green:greenColor / 255.0f blue:blueColor / 255.0f alpha:alpha];
}


+(instancetype)colorWithRGB:(NSArray *)rgbArray
{
    NSMutableArray *rgbaArray = [[NSMutableArray alloc] initWithArray:rgbArray];
    [rgbaArray addObject:@1];
    
    return [[self class] colorWithRGBA:[NSArray arrayWithArray:rgbaArray]];
}

+(instancetype)colorWithRGBA:(NSArray *)rgbaArray
{
    CGFloat red, green, blue, alpha;
    
    if (rgbaArray.count < 4) {
        return nil;
    }

    red   = [rgbaArray[0] floatValue] / 255;
    green = [rgbaArray[1] floatValue] / 255;
    blue  = [rgbaArray[2] floatValue] / 255;
    alpha = [rgbaArray[3] floatValue];
    
    return [[self class] colorWithRed:red green:green blue:blue alpha:alpha];
}


+(instancetype)colorWithHSB:(NSArray *)hsbArray
{
    NSMutableArray *hsbaArray = [[NSMutableArray alloc] initWithArray:hsbArray];
    [hsbaArray addObject:@1];
    
    return [[self class] colorWithHSBA:[NSArray arrayWithArray:hsbaArray]];
}

+(instancetype)colorWithHSBA:(NSArray *)hsbaArray
{
    CGFloat hue, saturation, brightness, alpha;
    
    if (hsbaArray.count < 4) {
        return [[self class] clearColor];
    }
    
    hue        = [hsbaArray[0] floatValue] / 360;
    saturation = [hsbaArray[1] floatValue] / 100;
    brightness = [hsbaArray[2] floatValue] / 100;
    alpha      = [hsbaArray[3] floatValue];
    
    return [[self class] colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}


#pragma mark - Color channel functions
-(NSString *)getHexString
{
    unsigned int red, green, blue;
    
    NSArray *colors = [self getRGBAArray];
    red   = [colors[0] floatValue];
    green = [colors[1] floatValue];
    blue  = [colors[2] floatValue];
    
    NSString *redHex   = [NSString stringWithFormat:@"%02x", red];
    NSString *greenHex = [NSString stringWithFormat:@"%02x", green];
    NSString *blueHex  = [NSString stringWithFormat:@"%02x", blue];
    
    return [[NSString stringWithFormat:@"#%@%@%@", redHex, greenHex, blueHex] uppercaseString];
}

-(NSArray *)getRGBAArray
{
    int r, g, b;
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    r = red * 255;
    g = green * 255;
    b = blue * 255;
    
    return @[@(r),@(g),@(b),@(alpha)];
}

-(NSArray *)getHSBAArray
{
    int h, s, b;
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    h = hue * 360;
    s = saturation * 100;
    b = brightness * 100;

    return @[@(h),@(s),@(b),@(alpha)];
}


-(CGFloat)getRed
{
    return [[self getRGBAArray][0] floatValue];
}

-(CGFloat)getGreen
{
    return [[self getRGBAArray][1] floatValue];
}

-(CGFloat)getBlue
{
    return [[self getRGBAArray][2] floatValue];
}

-(CGFloat)getHue
{
    return [[self getHSBAArray][0] floatValue];
}

-(CGFloat)getSaturation
{
    return [[self getHSBAArray][1] floatValue];
}

-(CGFloat)getBrightness
{
    return [[self getHSBAArray][2] floatValue];
}

-(CGFloat)getAlpha
{
    return [[self getRGBAArray][3] floatValue];
}



#pragma mark - Color operation functions
-(instancetype)saturateColor:(CGFloat)amount
{
    NSMutableArray *base = [[NSMutableArray alloc] initWithArray:[self getHSBAArray]];
    CGFloat saturation = [base[1] floatValue] + amount;
    
    if (saturation > 100) {
        saturation = 100.0;
    } else if (saturation < 0) {
        saturation = 0.0;
    }
    
    [base replaceObjectAtIndex:1 withObject:@(saturation)];
    return [[self class] colorWithHSBA:base];
}

-(instancetype)desaturateColor:(CGFloat)amount
{
    return [self saturateColor:-amount];
}


-(instancetype)lightenColor:(CGFloat)amount
{
    NSMutableArray *base = [[NSMutableArray alloc] initWithArray:[self getHSBAArray]];
    CGFloat brightness = [base[2] floatValue] + amount;
    
    if (brightness > 100) {
        brightness = 100.0;
    } else if (brightness < 0) {
        brightness = 0.0;
    }
    
    [base replaceObjectAtIndex:2 withObject:@(brightness)];
    return [[self class] colorWithHSBA:base];
}

-(instancetype)darkenColor:(CGFloat)amount
{
    return [self lightenColor:-amount];
}

-(instancetype)spinColor:(CGFloat)angle
{
    NSMutableArray *base = [[NSMutableArray alloc] initWithArray:[self getHSBAArray]];
    CGFloat ang = [base[0] floatValue] + angle;
    ang = fmodf(ang, 360);
    if (ang < 0) {
        ang += 360;
    }
    
    [base replaceObjectAtIndex:0 withObject:@(ang)];
    return [[self class] colorWithHSBA:base];
}

-(instancetype)greyscaleColor
{
    return [self desaturateColor:100];
}


#pragma mark - Color blending functions
+(instancetype)blendingColorsWithMultiply:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendMultiply first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithScreen:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendScreen first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithOverlay:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendOverlay first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithSoftlight:(id)firstColor secondColor:(id)secondColor
{
   return [self colorBlend:ColorBlendSoftlight first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithHardlight:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendHardlight first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithDifference:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendDifference first:firstColor second:secondColor];
}

+(instancetype)blendingColorsWithExclusion:(id)firstColor secondColor:(id)secondColor
{
    return [self colorBlend:ColorBlendExclusion first:firstColor second:secondColor];
}

#pragma mark - Special Effects
+ (UIColor*)contrastLumaColor:(UIColor*)color threshold:(CGFloat)threshold{
	size_t countComponents = CGColorGetNumberOfComponents(color.CGColor);
	const CGFloat *components = CGColorGetComponents(color.CGColor);
	//compute relative luminance
	CGFloat relativeLuminance = 0;
	if (countComponents == 4)
		relativeLuminance = 1 - (0.2126f * components[0] + 0.7152f * components[1] + 0.0722f * components[2]);
	else if (countComponents == 2)
		relativeLuminance = 1 - (0.2126f * components[0] + 0.7152f * components[0] + 0.0722f * components[0]);

	if (relativeLuminance >= threshold) {
		return [UIColor whiteColor];
	} else {
		return [UIColor blackColor];
	}
}

+ (UIColor *)colorWithLuminance:(CGFloat)luminance withA:(CGFloat)a withB:(CGFloat)b{
	CGFloat saturation = sqrt(a * a + b * b);
	CGFloat hue = atan(b/a);
	return [UIColor colorWithHue:hue saturation:saturation brightness:luminance alpha:1];
}

+ (instancetype)blendingColorsWithAlphaCompositing:(UIColor*)firstColor withColor:(UIColor*)secondColor{
	CGFloat r1, g1, b1, a1;
	CGFloat r2, g2, b2, a2;
	[firstColor getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
	[secondColor getRed:&r2 green:&g2 blue:&b2 alpha:&a2];

	CGFloat blendedAlpha = a1 + a2*(1 - a1);
	CGFloat blendedRedComponent = (r1 * a1 + r2*a2*(1 - a1) ) / blendedAlpha;
	CGFloat blendedGreenComponent = (g1 * a1 + g2*a2*(1 - a1)) / blendedAlpha;
	CGFloat blendedBlueComponent = (b1 * a1 + b2*a2*(1 - a1)) / blendedAlpha;

	return [UIColor colorWithRed:blendedRedComponent green:blendedGreenComponent blue:blendedBlueComponent alpha:blendedAlpha];
}


#pragma mark - Privates methods
+(instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+(NSString *)convertHEXString:(NSString *)string
{
    NSString *r, *g, *b;
    
    if (string.length == 3) {
        r = [NSString stringWithFormat:@"%c%c" ,[string characterAtIndex:0], [string characterAtIndex:0]];
        g = [NSString stringWithFormat:@"%c%c" ,[string characterAtIndex:1], [string characterAtIndex:1]];
        b = [NSString stringWithFormat:@"%c%c" ,[string characterAtIndex:2], [string characterAtIndex:2]];
        
        return [NSString stringWithFormat:@"%@%@%@", r, g, b];
    }
    return string;
}


+(instancetype)colorBlend:(ColorBlend)type first:(id)color1 second:(id)color2
{
    // inspired from Less css
    int i;
    float ab = [color1 getAlpha];
    float as = [color2 getAlpha];
    float cb, cs;
    
    float ar = 0, cr = 0;
    NSMutableArray *r = [[NSMutableArray alloc] init];
    
    ar = as + ab * (1 - as);
    for (i = 0; i < 3; i++) {
        cb = [[color1 getRGBAArray][i] floatValue];
        cs = [[color2 getRGBAArray][i] floatValue];

        switch (type) {
            case 0:
                cr = [self colorBlendModeMultiply:cb second:cs];
                break;
            case 1:
                cr = [self colorBlendModeScreen:cb second:cs];
                break;
            case 2:
                cr = [self colorBlendModeOverlay:cb second:cs];
                break;
            case 3:
                cr = [self colorBlendModeSoftlight:cb second:cs];
                break;
            case 4:
                cr = [self colorBlendModeHardlight:cb second:cs];
                break;
            case 5:
                cr = [self colorBlendModeDifference:cb second:cs];
                break;
            case 6:
                cr = [self colorBlendModeExclusion:cb second:cs];
                break;
   
            default:
                cr = 0;
                break;
        }
        if (ar != 0) {
            cr = (as * cs + ab * (cb - as * (cb + cs - cr))) / ar;
        }
        [r addObject:@(cr)];
    }
    [r addObject:@(1)]; // alpha channel
    
    return [[self class] colorWithRGB:[NSArray arrayWithArray:r]];
}

+(float)colorBlendModeMultiply:(float)color1 second:(float)color2
{
    return color1 * color2;
}

+(float)colorBlendModeScreen:(float)color1 second:(float)color2
{
    return color1 + color2 - color1 * color2;
}

+(float)colorBlendModeOverlay:(float)color1 second:(float)color2
{
    color1 *= 2;
    if (color1 <= 1) {
        return [self colorBlendModeMultiply:color1 second:color2];
    } else {
        return [self colorBlendModeScreen:color1 second:color2];
    }
}

+(float)colorBlendModeSoftlight:(float)color1 second:(float)color2
{
    float d = 1, e = color1;
    if (color2 > 0.5) {
        e = 1;
        d = (color1 > 0.25) ? sqrtf(color1) \
        : ((16 * color1 - 12) * color1 + 4) * color1;
    }
    return color1 - (1 - 2 * color2) * e * (d - color1);
}

+(float)colorBlendModeHardlight:(float)color1 second:(float)color2
{
    return [self colorBlendModeOverlay:color2 second:color1];
}

+(float)colorBlendModeDifference:(float)color1 second:(float)color2
{
    return fabsf(color1 - color2);
}

+(float)colorBlendModeExclusion:(float)color1 second:(float)color2
{
    return color1 + color2 - 2 * color1 * color2;
}


@end
