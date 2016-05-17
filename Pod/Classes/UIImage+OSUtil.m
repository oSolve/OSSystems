//
// Created by Huang ChienShuo on 12/22/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import "UIImage+OSUtil.h"

@implementation UIImage(OSUtil)
// use this methon in thread
- (UIImage *)cropImageWithRect:(CGRect) rect {
    CGRect cropRect = CGRectMake(rect.origin.x * self.scale,
                                 rect.origin.y * self.scale,
                                 rect.size.width * self.scale,
                                 rect.size.height * self.scale);

    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], cropRect);

    UIImage *croppedImage = [[UIImage alloc] initWithCGImage:imageRef
                                                       scale:1.0
                                                 orientation:self.imageOrientation];
    CGImageRelease(imageRef);

    return croppedImage;
}

- (UIImage *)resizeImageWithSize:(CGSize) newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width * self.scale, newSize.height * self.scale)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *) color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)imageWithRect:(CGRect) rect color:(UIColor *) color {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)stretchableImageWithColor:(UIColor *) color {
    return [[UIImage imageWithRect:CGRectMake(0, 0, 10, 10)
                             color:color]
                     resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 4, 4)];
}

- (UIImage *)tintedImageWithColor:(UIColor *) tintColor {
    // It's important to pass in 0.0f to this function to draw the image to the scale of the screen
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];

    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tintedImage;
}

@end