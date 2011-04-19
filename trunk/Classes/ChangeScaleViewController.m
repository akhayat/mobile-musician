//
//  ChangeScaleViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 4/17/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "ChangeScaleViewController.h"


@implementation ChangeScaleViewController

@synthesize delegate;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	self.view.hidden = !self.view.hidden;
}

-(IBAction)naturalMinorScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithNaturalMinorScale];
	self.view.hidden = !self.view.hidden;
}

-(IBAction)harmonicMinorScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithHarmonicMinorScale];
	self.view.hidden = !self.view.hidden;
}

-(IBAction)BluesScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithBluesScale];
	self.view.hidden = !self.view.hidden;	
}

-(IBAction)majorPentatonicScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithMajorPentatonicScale];
	self.view.hidden = !self.view.hidden;
}

-(IBAction)minorPentatonicScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithMinorPentatonicScale];
	self.view.hidden = !self.view.hidden;
}

-(IBAction)chromaticScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithChromaticScale];
	self.view.hidden = !self.view.hidden;
} 

-(IBAction)wholeToneScaleButton: (id) sender {
	self.delegate.delegate.currentScale = [[Scale alloc] initWithWholeToneScale];
	self.view.hidden = !self.view.hidden;
}

-(IBAction)customScaleButton: (id) sender {
	//TODO
}

- (void)dealloc {
    [super dealloc];
}

@end
