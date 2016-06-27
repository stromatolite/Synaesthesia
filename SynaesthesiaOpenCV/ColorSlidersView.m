//
//  ColorSlidersView.m
//  SynaesthesiaOpenCV
//
//  Created by Cyril Laurier on 17/04/15.
//  Copyright (c) 2015 Stromatolite. All rights reserved.
//

#import "ColorSlidersView.h"

@interface ColorSlidersView ()

@property (nonatomic)  UISlider *sliderLowH;
@property (nonatomic)  UISlider *sliderHighH;
@property (nonatomic)  UISlider *sliderLowS;
@property (nonatomic)  UISlider *sliderHighS;
@property (nonatomic)  UISlider *sliderLowV;
@property (nonatomic)  UISlider *sliderHighV;

@property (nonatomic)  UILabel *valueLabelLowH;
@property (nonatomic)  UILabel *valueLabelHighH;
@property (nonatomic)  UILabel *valueLabelLowS;
@property (nonatomic)  UILabel *valueLabelHighS;
@property (nonatomic)  UILabel *valueLabelLowV;
@property (nonatomic)  UILabel *valueLabelHighV;

@property (nonatomic)  UILabel *labelLowH;
@property (nonatomic)  UILabel *labelHighH;
@property (nonatomic)  UILabel *labelLowS;
@property (nonatomic)  UILabel *labelHighS;
@property (nonatomic)  UILabel *labelLowV;
@property (nonatomic)  UILabel *labelHighV;

@end

@implementation ColorSlidersView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initView];
    }
    return self;
}

- (void) initView
{
    
    self.sliderLowH = [[UISlider alloc] initWithFrame:CGRectZero];
    self.sliderHighH = [[UISlider alloc] initWithFrame:CGRectZero];
    self.sliderLowS = [[UISlider alloc] initWithFrame:CGRectZero];
    self.sliderHighS = [[UISlider alloc] initWithFrame:CGRectZero];
    self.sliderLowV = [[UISlider alloc] initWithFrame:CGRectZero];
    self.sliderHighV = [[UISlider alloc] initWithFrame:CGRectZero];
    
    [self.sliderLowH addTarget:self action:@selector(changedLowH:) forControlEvents:UIControlEventValueChanged];
    [self.sliderHighH addTarget:self action:@selector(changedHighH:) forControlEvents:UIControlEventValueChanged];
    [self.sliderLowS addTarget:self action:@selector(changedLowS:) forControlEvents:UIControlEventValueChanged];
    [self.sliderHighS addTarget:self action:@selector(changedHighS:) forControlEvents:UIControlEventValueChanged];
    [self.sliderLowV addTarget:self action:@selector(changedLowV:) forControlEvents:UIControlEventValueChanged];
    [self.sliderHighV addTarget:self action:@selector(changedHighV:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.sliderLowH];
    [self addSubview:self.sliderHighH];
    [self addSubview:self.sliderLowS];
    [self addSubview:self.sliderHighS];
    [self addSubview:self.sliderLowV];
    [self addSubview:self.sliderHighV];
    
    self.valueLabelLowH = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valueLabelHighH = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valueLabelLowS = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valueLabelHighS = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valueLabelLowV = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valueLabelHighV = [[UILabel alloc] initWithFrame:CGRectZero];
    
    [self addSubview:self.valueLabelLowH];
    [self addSubview:self.valueLabelHighH];
    [self addSubview:self.valueLabelLowS];
    [self addSubview:self.valueLabelHighS];
    [self addSubview:self.valueLabelLowV];
    [self addSubview:self.valueLabelHighV];
    
    self.labelLowH = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelHighH = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelLowS = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelHighS = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelLowV = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelHighV = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.labelLowH.text = @"LowH";
    self.labelHighH.text = @"HighH";
    self.labelLowS.text = @"LowS";
    self.labelHighS.text = @"HighS";
    self.labelLowV.text = @"LowV";
    self.labelHighV.text = @"HighV";
    
    [self addSubview:self.labelLowH];
    [self addSubview:self.labelHighH];
    [self addSubview:self.labelLowS];
    [self addSubview:self.labelHighS];
    [self addSubview:self.labelLowV];
    [self addSubview:self.labelHighV];
    
    self.sliderLowH.value = 0;
    self.lowHue = 0;
    self.sliderHighH.value = 1.0;
    self.highHue = 179;
    self.sliderLowS.value = 0;
    self.lowSaturation = 0;
    self.sliderHighS.value = 1.0;
    self.highSaturation = 255;
    self.sliderLowV.value = 0;
    self.lowValue = 0;
    self.sliderHighV.value = 1.0;
    self.highValue = 255;
    
    self.valueLabelLowH.text = [NSString stringWithFormat:@"%d", self.lowHue];
    self.valueLabelHighH.text = [NSString stringWithFormat:@"%d", self.highHue];
    self.valueLabelLowS.text = [NSString stringWithFormat:@"%d", self.lowSaturation];
    self.valueLabelHighS.text = [NSString stringWithFormat:@"%d", self.highSaturation];
    self.valueLabelLowV.text = [NSString stringWithFormat:@"%d", self.lowValue];
    self.valueLabelHighV.text = [NSString stringWithFormat:@"%d", self.highValue];
}


- (void) layoutSubviews
{
    // Sliders
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat numSliders = 6;
    CGFloat marginTopBottom = 20;
    CGFloat sliderRatio = 0.8;
    CGFloat sliderHeight = 20;
    CGFloat labelWidth = width*(1-sliderRatio)/2.0;

    
    CGFloat verticalSpaceBetweenSliders = (height-(2*marginTopBottom + numSliders*sliderHeight))/(numSliders-1);
    CGFloat yOffsetSliders = sliderHeight + verticalSpaceBetweenSliders;
    CGRect sliderFrame = CGRectMake(marginTopBottom, marginTopBottom, width*sliderRatio, sliderHeight);
    self.sliderLowH.frame = sliderFrame;
    sliderFrame.origin.y += yOffsetSliders;
    self.sliderHighH.frame = sliderFrame;
    sliderFrame.origin.y += yOffsetSliders;
    self.sliderLowS.frame = sliderFrame;
    sliderFrame.origin.y += yOffsetSliders;
    self.sliderHighS.frame = sliderFrame;
    sliderFrame.origin.y += yOffsetSliders;
    self.sliderLowV.frame = sliderFrame;
    sliderFrame.origin.y += yOffsetSliders;
    self.sliderHighV.frame = sliderFrame;
    
    CGRect labelFrame = self.sliderLowH.frame;
    labelFrame.origin.x += width*sliderRatio+5;
    labelFrame.size.width = labelWidth;
    self.valueLabelLowH.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighH.frame.origin.y;
    self.valueLabelHighH.frame = labelFrame;
    labelFrame.origin.y = self.sliderLowS.frame.origin.y;
    self.valueLabelLowS.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighS.frame.origin.y;
    self.valueLabelHighS.frame = labelFrame;
    labelFrame.origin.y = self.sliderLowV.frame.origin.y;
    self.valueLabelLowV.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighV.frame.origin.y;
    self.valueLabelHighV.frame = labelFrame;
    
    labelFrame = self.valueLabelLowH.frame;
    labelFrame.origin.x += labelWidth;
    labelFrame.size.width = labelWidth;
    self.labelLowH.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighH.frame.origin.y;
    self.labelHighH.frame = labelFrame;
    labelFrame.origin.y = self.sliderLowS.frame.origin.y;
    self.labelLowS.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighS.frame.origin.y;
    self.labelHighS.frame = labelFrame;
    labelFrame.origin.y = self.sliderLowV.frame.origin.y;
    self.labelLowV.frame = labelFrame;
    labelFrame.origin.y = self.sliderHighV.frame.origin.y;
    self.labelHighV.frame = labelFrame;


}

-(void)setLowHue:(int)lowHue
{
    _lowHue = lowHue;
    self.valueLabelLowH.text = [NSString stringWithFormat:@"%d", lowHue];
}

-(void)setHighHue:(int)highHue
{
    _highHue = highHue;
    self.valueLabelHighH.text = [NSString stringWithFormat:@"%d", highHue];
}

-(void)setLowSaturation:(int)lowSaturation
{
    _lowSaturation = lowSaturation;
    self.valueLabelLowS.text = [NSString stringWithFormat:@"%d", lowSaturation];
}

-(void)setHighSaturation:(int)highSaturation
{
    _highSaturation = highSaturation;
    self.valueLabelHighS.text = [NSString stringWithFormat:@"%d", highSaturation];
}

-(void)setLowValue:(int)lowValue
{
    _lowValue = lowValue;
    self.valueLabelLowV.text = [NSString stringWithFormat:@"%d", lowValue];
}

-(void)setHighValue:(int)highValue
{
    _highValue = highValue;
    self.valueLabelHighV.text = [NSString stringWithFormat:@"%d", highValue];
}

- (void)changedLowH:(UISlider*)sender {
    self.lowHue = sender.value*255.0;
}
- (void)changedHighH:(UISlider*)sender {
    self.highHue = sender.value*179.0;
}
- (void)changedLowS:(UISlider*)sender {
    self.lowSaturation = sender.value*255.0;
}
- (void)changedHighS:(UISlider*)sender {
    self.highSaturation = sender.value*255.0;
}
- (void)changedLowV:(UISlider*)sender {
    self.lowValue = sender.value*255.0;
}
- (void)changedHighV:(UISlider*)sender {
    self.highValue = sender.value*255.0;
}

@end
