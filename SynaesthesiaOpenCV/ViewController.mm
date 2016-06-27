//
//  ViewController.m
//  SynaesthesiaOpenCV
//
//  Created by Cyril Laurier on 22/03/15.
//  Copyright (c) 2015 Stromatolite. All rights reserved.
//  Based on http://opencv-srf.blogspot.com.es/2010/09/object-detection-using-color-seperation.html

#import "ViewController.h"
#import "ColorSlidersView.h"
#import <opencv2/highgui/cap_ios.h>
#import <opencv2/highgui/highgui.hpp>
#import <opencv2/imgproc/imgproc.hpp>

using namespace cv;

@interface ViewController () <CvVideoCameraDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) CvVideoCamera* videoCamera;
@property (weak, nonatomic) IBOutlet ColorSlidersView *colorSlidersView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.imageView];
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    self.videoCamera.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionStart:(id)sender {
    
    [self.videoCamera start];
    
}


#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
- (void)processImage:(Mat&)image;
{
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, CV_BGRA2BGR);
    
    Mat imgHSV;
    
    cvtColor(image_copy, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
    
    Mat imgThresholded;
    
    inRange(imgHSV, Scalar(self.colorSlidersView.lowHue, self.colorSlidersView.lowSaturation, self.colorSlidersView.lowValue), Scalar(self.colorSlidersView.highHue, self.colorSlidersView.highSaturation, self.colorSlidersView.highValue), imgThresholded); //Threshold the image
    
    //morphological opening (remove small objects from the foreground)
    erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, cv::Size(5, 5)) );
    dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, cv::Size(5, 5)) );
    
    //morphological closing (fill small holes in the foreground)
    dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, cv::Size(5, 5)) );
    erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, cv::Size(5, 5)) );
    
    // Add blob detector : SimpleBlobDetector !
    // http://docs.opencv.org/modules/features2d/doc/common_interfaces_of_feature_detectors.html
    
    // Detect % of white and black ?
    vector<Mat> channels;
    split(imgThresholded, channels);
    Scalar m = mean(channels[0]);
    printf("%f\n", m[0]);
    
    // Display image
    image = imgThresholded;
    
    
}
#endif

@end
