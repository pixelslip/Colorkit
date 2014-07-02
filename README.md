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

**+(instancetype)colorWithHexString:(NSString *)hexString;**

Create a color with a HEX String *@"#FF0000", @"#F00", @"FF0000", @"F00"*

<pre><code>UIColor *redColor = [UIColor colorWithHexString:@"#FF0000"];  
UIColor *backgroundColor = [UIColor colorWithHexString:@"35A"];
</code></pre>


## Author

pixelslip, pixelslip@gmail.com

## License

Colorkit is available under the MIT license. See the LICENSE file for more info.
