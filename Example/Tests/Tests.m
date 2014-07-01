//
//  ColorkitTests.m
//  ColorkitTests
//
//  Created by pixelslip on 06/29/2014.
//  Copyright (c) 2014 pixelslip. All rights reserved.
//

#import <Colorkit.h>

SpecBegin(InitialSpecs)

describe(@"Color Instances", ^{
    it(@"from hex string", ^{
        expect([UIColor redColor]).to.equal([UIColor colorWithHexString:@"FF0000"]);
        expect([UIColor redColor]).to.equal([UIColor colorWithHexString:@"#F00"]);
        expect([UIColor redColor]).to.equal([UIColor colorWithHexString:@"F00"]);
        
        expect([UIColor greenColor]).toNot.equal([UIColor colorWithHexString:@"3355AA"]);
        expect([UIColor blueColor]).to.equal([UIColor colorWithHexString:@"#0000FF"]);
    });
    it(@"from hex string with alpha", ^{
        expect([UIColor colorWithRed:1 green:0 blue:0 alpha:0.5]).to.equal([UIColor colorWithHexString:@"#FF0000" alpha:0.5]);
    });

    it(@"from and get RGBA Array", ^{
        NSArray *testRGBAArray = [[UIColor redColor] getRGBAArray];
        UIColor *testColor = [UIColor colorWithRGBA:testRGBAArray];
        expect([UIColor redColor]).to.equal(testColor);
    });
    
    it(@"from and get HSBA Array", ^{
        NSArray *testHSBAArray = [[UIColor redColor] getHSBAArray];
        UIColor *testColor = [UIColor colorWithHSB:testHSBAArray];
        expect([UIColor redColor]).to.equal(testColor);
    });
});

describe(@"Color Channel", ^{
    
    it(@"get hex string", ^{
        expect(@"#FF0000").to.equal([[UIColor redColor] getHexString]);
        expect(@"FF0000").notTo.equal([[UIColor redColor] getHexString]);
    });
    
    it(@"get red value", ^{
        expect([[UIColor redColor] getRed]).to.equal(@255);
    });
    it(@"get green value", ^{
        expect([[UIColor greenColor] getGreen]).to.equal(@255);
    });
    it(@"get blue value", ^{
        expect([[UIColor blueColor] getBlue]).to.equal(@255);
    });
    
    it(@"get hue value", ^{
        expect([[UIColor colorWithHexString:@"#5C99A6"] getHue]).to.beInTheRangeOf(@189, @191);
    });
    it(@"get saturation value", ^{
        expect([[UIColor colorWithHexString:@"#5C99A6"] getSaturation]).to.beInTheRangeOf(@44, @46);
    });
    it(@"get brightness value", ^{
        expect([[UIColor colorWithHexString:@"#5C99A6"] getBrightness]).to.beInTheRangeOf(@64, @66);
    });
    
    it(@"get alpha value", ^{
        expect([[UIColor colorWithHexString:@"#5C99A6" alpha:0.5] getAlpha]).to.equal(@0.5);
    });
    
});
    
describe(@"Color operation", ^{
    
    it(@"Saturate color", ^{
        expect([[UIColor colorWithHexString:@"FF6666"] saturateColor:100]).to.equal([UIColor redColor]);
    });
    it(@"Desaturate color", ^{
        expect([[UIColor redColor] desaturateColor:100]).to.equal([UIColor colorWithHexString:@"FFFFFF"]);
    });
    it(@"Lighten color", ^{
        expect([[UIColor colorWithHexString:@"800000"] lightenColor:100]).to.equal([UIColor redColor]);
    });
    it(@"Darken color", ^{
        expect([[UIColor redColor] darkenColor:100]).to.equal([UIColor colorWithHexString:@"000000"]);
    });
    it(@"Spin color", ^{
        expect([[UIColor redColor] spinColor:120.0]).to.equal([UIColor greenColor]);
        expect([[UIColor redColor] spinColor:240.0]).to.equal([UIColor blueColor]);
        expect([[UIColor redColor] spinColor:720.0]).to.equal([UIColor redColor]);
        expect([[UIColor redColor] spinColor:-720.0]).to.equal([UIColor redColor]);
        expect([[UIColor redColor] spinColor:-13456.0]).notTo.equal([UIColor redColor]);
    });
    it(@"Greyscale color", ^{
        expect([[[UIColor redColor] greyscaleColor] getSaturation]).to.equal(@0);
    });
    
});

describe(@"Color blending", ^{
    
    it(@"Multiply", ^{
        expect([UIColor blendingColorsWithMultiply:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"000000"]);
    });
    
    it(@"Screen", ^{
        expect([UIColor blendingColorsWithScreen:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"FF00FF"]);
    });
    
    it(@"Overlay", ^{
        expect([UIColor blendingColorsWithOverlay:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"FF0000"]);
    });
    
    it(@"Softlight", ^{
        expect([UIColor blendingColorsWithSoftlight:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"FF0000"]);
    });
    
    it(@"Hardlight", ^{
        expect([UIColor blendingColorsWithHardlight:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"0000FF"]);
    });
    
    it(@"Difference", ^{
        expect([UIColor blendingColorsWithDifference:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"FF00FF"]);
    });
    
    it(@"Exclusion", ^{
        expect([UIColor blendingColorsWithExclusion:[UIColor redColor] secondColor:[UIColor blueColor]]).to.equal([UIColor colorWithHexString:@"FF00FF"]);
    });
    
    
});


SpecEnd
