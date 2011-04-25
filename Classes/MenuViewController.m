//
//  MenuViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 4/10/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "MenuViewController.h"
#import "ChangeScaleViewController.h"

@implementation MenuViewController

@synthesize delegate;
@synthesize changeScaleViewController;
@synthesize scaleLabel;

-(IBAction)closeButtonPressed: (id) sender {
	[self.delegate menuButtonPressed: sender];
}

-(IBAction)rootChanged: (id) sender {
	int rootSelecteed = [sender selectedSegmentIndex];
	self.delegate.root.name = rootSelecteed;
}

-(IBAction)changeScale: (id) sender {
	if (self.changeScaleViewController == nil) {
		self.changeScaleViewController = [[ChangeScaleViewController alloc] 
										  initWithNibName: @"ChangeScaleViewController" bundle: nil];
		[self.view addSubview: self.changeScaleViewController.view];
		self.changeScaleViewController.delegate = self;
	} else {
		self.changeScaleViewController.view.hidden = !self.changeScaleViewController.view.hidden;
	}
}

-(IBAction)toggleDisplay: (id) sender {
	delegate.displayNames = ((UISwitch *)sender).on;
}

-(IBAction)changeInstrument: (id) sender {
	switch ([sender selectedSegmentIndex]) {
		case 0:
			self.delegate.newInstrument = @"Piano";
			break;
		case 1:
			self.delegate.newInstrument = @"CleanGuitar";
		default:
			break;
	}
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
*/

- (void)viewDidLoad {
	self.changeScaleViewController = nil;
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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


- (void)dealloc {
	[scaleLabel release];
	[changeScaleViewController release];
    [super dealloc];
}


@end
