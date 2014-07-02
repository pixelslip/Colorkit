//
//  Colorkit.h
//
//  Created by Pierre Boumal
//  The MIT Licence (MIT)
//  Copyright (c) 2014 Pierre Boumal pixelslip@gmail.com
//

#import <UIKit/UIKit.h>

@interface UIColor (Colorkit)

#pragma mark - Enum
// Color Blending Enum
typedef NS_ENUM(NSInteger, ColorBlend) {
    ColorBlendMultiply,
    ColorBlendScreen,
    ColorBlendOverlay,
    ColorBlendSoftlight,
    ColorBlendHardlight,
    ColorBlendDifference,
    ColorBlendExclusion
};

#pragma mark - Class methods
/**
 Create a color with a HEX String
 
 @param hexString Hex String like @"#3355AA" or @"3355AA"
 @return UIColor
 */
+(instancetype)colorWithHexString:(NSString *)hexString;

/**
 Create a color with a HEX String with an alpha value
 
 @param hexString Hex String like @"#3355AA" or @"3355AA"
 @param alpha Float value for alpha(0-1)
 @return UIColor
 */
+(instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 Create a color with an array of rgb values like @[@255,@20,@43]
 
 @param rgbArray Array of 3 numbers red(0-255) green(0-255) blue(0-255)
 @return UIColor
 */
+(instancetype)colorWithRGB:(NSArray *)rgbArray;

/**
 Create a color with an array of rgba values like @[@255,@120,@43,@0.5]
 
 @param rgbaArray Array of 4 numbers red(0-255) green(0-255) blue(0-255) alpha(0-1)
 @return UIColor
 */
+(instancetype)colorWithRGBA:(NSArray *)rgbaArray;

/**
 Create a color with an array of hsb values like @[@360,@80,@54]
 
 @param hsbArray Array of 3 numbers hue(0-360) saturation(0-100) brightness(0-100)
 @return UIColor
 */
+(instancetype)colorWithHSB:(NSArray *)hsbArray;

/**
 Create a color with an array of hsba values like @[@360,@80,@54,@0.5]
 
 @param hsbaArray Array of 4 numbers hue(0-360) saturation(0-100) brightness(0-100) alpha(0-1)
 @return UIColor
 */
+(instancetype)colorWithHSBA:(NSArray *)hsbaArray;


#pragma mark - Color channel functions
/**
 Get a HEX String from a Color
 
 @return NSString
 */
-(NSString *)getHexString;

/**
 Get an Array of RGBA Numbers from a Color
 
 @return NSArray red(0-255) green(0-255) blue(0-255) alpha(0-1)
 */
-(NSArray *)getRGBAArray;

/**
 Get an Array of HSBA Numbers from a Color
 
 @return NSArray hue(0-360) saturation(0-100) brightness(0-100) alpha(0-1)
 */
-(NSArray *)getHSBAArray;

/**
 Get the red value of a Color
 
 @return CGFloat (0-255)
 */
-(CGFloat)getRed;

/**
 Get the green value of a Color
 
 @return CGFloat (0-255)
 */
-(CGFloat)getGreen;

/**
 Get the blue value of a Color
 
 @return CGFloat (0-255)
 */
-(CGFloat)getBlue;

/**
 Get the hue value of a Color
 
 @return CGFloat (0-360)
 */
-(CGFloat)getHue;

/**
 Get the saturation value of a Color
 
 @return CGFloat (0-100)
 */
-(CGFloat)getSaturation;

/**
 Get the brightness value of a Color
 
 @return CGFloat (0-100)
 */
-(CGFloat)getBrightness;

/**
 Get the alpha value of a Color
 
 @return CGFloat (0-1)
 */
-(CGFloat)getAlpha;


#pragma mark - Color operation functions
/**
 Saturate a color with a pourcentage value
 
 @param amount float value (0-100)
 @return UIColor
 */
-(instancetype)saturateColor:(CGFloat)amount;

/**
 Desaturate a color with a pourcentage value (0-1)
 
 @param amount float value (0-100)
 @return UIColor
 */
-(instancetype)desaturateColor:(CGFloat)amount;

/**
 Light a color with a pourcentage value
 
 @param amount float value (0-100)
 @return UIColor
 */
-(instancetype)lightenColor:(CGFloat)amount;

/**
 Saturate a color with a pourcentage value
 
 @param amount float value (0-100)
 @return UIColor
 */
-(instancetype)darkenColor:(CGFloat)amount;

/**
 Spin a color with a degre value
 
 @param angle float value (0-360)
 @return UIColor
 */
-(instancetype)spinColor:(CGFloat)angle;

/**
 Return the color desaturate. Same as desaturateColor:100
 
 @return UIColor
 */
-(instancetype)greyscaleColor;

#pragma mark - Color blending functions

/**
 Blending two colors with Multiply
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithMultiply:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Screen
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithScreen:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Overlay
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithOverlay:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Softlight
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithSoftlight:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Hardlight
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithHardlight:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Difference
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithDifference:(id)firstColor secondColor:(id)secondColor;

/**
 Blending two colors with Exclusion
 
 @param firstColor UIColor
 @param secondColor UIColor
 @return UIColor
 */
+(instancetype)blendingColorsWithExclusion:(id)firstColor secondColor:(id)secondColor;


@end
