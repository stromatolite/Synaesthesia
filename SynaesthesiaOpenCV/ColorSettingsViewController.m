//
//  ColorSettingsViewController.m
//  SynaesthesiaOpenCV
//
//  Created by Cyril Laurier on 18/04/15.
//  Copyright (c) 2015 Stromatolite. All rights reserved.
//

#import "ColorSettingsViewController.h"
#import "ColorSlidersView.h"

@interface ColorSettingsViewController ()

@property (nonatomic)  UIButton *resetButton;
@property (nonatomic)  UIButton *saveButton;

@property (nonatomic)  ColorSlidersView *colorSlidersView;


@end

@implementation ColorSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Color Sliders View
    self.colorSlidersView = [[ColorSlidersView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.colorSlidersView];
    
    // Reset Button
    self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    self.resetButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.resetButton];
    
    // Save Button
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    self.saveButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.saveButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews
{

    //
    CGFloat numButtons = 12;
    CGFloat buttonOffset = 2;
    CGFloat buttonHeight = 60;
    //
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat buttonWidth = width/numButtons-(numButtons-1)*buttonOffset;
    self.resetButton.frame = CGRectMake(0*(buttonWidth+buttonOffset), 0, buttonWidth, buttonHeight);
    self.saveButton.frame = CGRectMake(1*(buttonWidth+buttonOffset), 0, buttonWidth, buttonHeight);
    
    self.colorSlidersView.frame = CGRectMake(0, buttonHeight, width, height-buttonHeight);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
