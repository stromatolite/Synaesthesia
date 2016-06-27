//
//  ColorSlidersView.h
//  SynaesthesiaOpenCV
//
//  Created by Cyril Laurier on 17/04/15.
//  Copyright (c) 2015 Stromatolite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorSlidersView : UIView

@property (nonatomic, assign) int lowHue;
@property (nonatomic, assign) int highHue;

@property (nonatomic, assign) int lowSaturation;
@property (nonatomic, assign) int highSaturation;

@property (nonatomic, assign) int lowValue;
@property (nonatomic, assign) int highValue;

@end
