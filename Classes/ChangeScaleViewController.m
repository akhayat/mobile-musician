//
//  ChangeScaleViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 4/17/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "ChangeScaleViewController.h"
#import "CustomScaleViewController.h"

@implementation ChangeScaleViewController

@synthesize delegate;

-(IBAction) cancelButtonPressed: (id)sender {
	self.view.hidden = !self.view.hidden;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)majorScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithMajorScale];
	self.delegate.scaleLabel.text = @"Major";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)naturalMinorScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithNaturalMinorScale];
	self.delegate.scaleLabel.text = @"Natural Minor";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)harmonicMinorScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithHarmonicMinorScale];
	self.delegate.scaleLabel.text = @"Harmonic Minor";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)BluesScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithBluesScale];
	self.delegate.scaleLabel.text = @"Blues";
	self.view.hidden = !self.view.hidden;	
}

-(IBAction)majorPentatonicScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithMajorPentatonicScale];
	self.delegate.scaleLabel.text = @"Major Pentatonic";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)minorPentatonicScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithMinorPentatonicScale];
	self.delegate.scaleLabel.text = @"Minor Pentatonic";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)chromaticScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithChromaticScale];
	self.delegate.scaleLabel.text = @"Chromatic";
	self.view.hidden = !self.view.hidden;
} 

-(IBAction)wholeToneScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithWholeToneScale];
	self.delegate.scaleLabel.text = @"Whole Tone";
	self.view.hidden = !self.view.hidden;
}

-(IBAction)customScaleButton: (id) sender {
    self.delegate.customScaleViewController.view.hidden = NO;
    self.view.hidden = YES;
}

- (void)dealloc {
    [super dealloc];
}

@end
