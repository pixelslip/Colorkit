# Colorkit

[![CI Status](http://img.shields.io/travis/pixelslip/Colorkit.svg?style=flat)](https://travis-ci.org/pixelslip/Colorkit)
[![Version](https://img.shields.io/cocoapods/v/Colorkit.svg?style=flat)](http://cocoadocs.org/docsets/Colorkit)
[![License](https://img.shields.io/cocoapods/l/Colorkit.svg?style=flat)](http://cocoadocs.org/docsets/Colorkit)
[![Platform](https://img.shields.io/cocoapods/p/Colorkit.svg?style=flat)](http://cocoadocs.org/docsets/Colorkit)

## What is Colorkit ?

Colorkit is a surcharge of UIColor class. It's bring you more methods to create and manipulate colors in your iOS projects.


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

**With Cocoapod**

Colorkit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod "Colorkit"`

**With simple method**

Drag and drop **Colorkit.h** and **Colorkit.m** files into your project. Don't forget to import the file into your project

`#import "Colorkit.h"`

##Documentation

**+(instancetype)colorWithHexString:(NSString *)hexString**

Create a color with a HEX String *@"#FF0000", @"#F00", @"FF0000", @"F00"*

<pre><code>UIColor *redColor = [UIColor colorWithHexString:@"#FF0000"];  
UIColor *backgroundColor = [UIColor colorWithHexString:@"35A"];
</code></pre>

**+(instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha**

Same as above but with an alpha value (0-1)

<pre><code>UIColor *redColor = [UIColor colorWithHexString:@"#FF0000" alpha:0.5];  
</code></pre>

**+(instancetype)colorWithRGB:(NSArray *)rgbArray**

Create a color with an array of rgb values like @[@255,@120,@43]

<pre><code>UIColor *redColor = [UIColor colorWithRGB:@[@255, @0, @0]];
</code></pre>

**+(instancetype)colorWithRGBA:(NSArray *)rgbaArray**

Create a color with an array of rgba values like @[@255,@120, @43, @0.5]

<pre><code>UIColor *redColor = [UIColor colorWithRGB:@[@255, @0, @0, @1]];
</code></pre>

**+(instancetype)colorWithHSB:(NSArray *)hsbArray**

Create a color with an array of hsb values like @[360,80,54]

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)colorWithHSBA:(NSArray *)hsbaArray**

Create a color with an array of hsba values like @[360,80,54,0.5]

<pre><code>UIColor *redColor = [UIColor];
</code></pre>


**-(NSString *)getHexString**

Get a HEX String from a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(NSArray *)getRGBAArray**

Get an Array of RGBA Numbers from a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(NSArray *)getHSBAArray**

Get an Array of HSBA Numbers from a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getRed**

Get the red value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getGreen**

Get the green value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getBlue**

Get the blue value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getHue**

Get the hue value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getSaturation**

Get the saturation value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getBrightness**

Get the brightness value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(CGFloat)getAlpha**

Get the alpha value of a Color

<pre><code>UIColor *redColor = [UIColor];
</code></pre>


**-(instancetype)saturateColor:(CGFloat)amount**

Saturate a color with a pourcentage value

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(instancetype)desaturateColor:(CGFloat)amount**

Desaturate a color with a pourcentage value (0-1)

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(instancetype)lightenColor:(CGFloat)amount**

Light a color with a pourcentage value

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(instancetype)darkenColor:(CGFloat)amount**

Saturate a color with a pourcentage value

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**-(instancetype)spinColor:(CGFloat)angle**

Spin a color with a degre value

<pre><code>UIColor *redColor = [UIColor];
</code></pre>


**-(instancetype)greyscaleColor**

Return the color desaturate. Same as desaturateColor:100

<pre><code>UIColor *redColor = [UIColor];
</code></pre>


**+(instancetype)blendingColorsWithMultiply:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Multiply

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)blendingColorsWithScreen:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Screen

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)blendingColorsWithOverlay:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Overlay

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)blendingColorsWithSoftlight:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Softlight

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)blendingColorsWithHardlight:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Hardlight

<pre><code>UIColor *redColor = [UIColor];
</code></pre>

**+(instancetype)blendingColorsWithDifference:(id)firstColor secondColor:(id)secondColor**

Blending two colors with Difference

<pre><code>UIColor *redColor = [UIColor];
</code></pre>


**+(instancetype)blendingColorsWithExclusion:(id)firstColor secondColor:(id)secondColor**Blending two colors with Exclusion

<pre><code>UIColor *redColor = [UIColor];
</code></pre>






## Author

pixelslip, pixelslip@gmail.com

## License

Colorkit is available under the MIT license. See the LICENSE file for more info.
