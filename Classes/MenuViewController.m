//
//  MenuViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 4/10/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "MenuViewController.h"
#import "ChangeScaleViewController.h"
#import "CustomScaleViewController.h"

@implementation MenuViewController

@synthesize delegate, changeScaleViewController, scaleLabel, customScaleViewController;

-(IBAction)closeButtonPressed: (id) sender {
    [self.delegate menuButtonPressed: sender];
}

-(IBAction)rootChanged: (id) sender {
    int rootSelecteed = [sender selectedSegmentIndex];
    self.delegate.root = [[Note alloc] initWithName: rootSelecteed andOctave: self.delegate.root.octave];
}

-(IBAction)changeScale: (id) sender {
    if (self.changeScaleViewController == nil) {
        self.changeScaleViewController = [[ChangeScaleViewController alloc] 
										  initWithNibName: @"ChangeScaleViewController" bundle: nil];
        self.customScaleViewController = [[CustomScaleViewController alloc] 
										  initWithNibName: @"CustomScaleViewController" bundle: nil];
        [self.view addSubview: self.changeScaleViewController.view];
        [self.view addSubview: self.customScaleViewController.view];
        self.changeScaleViewController.delegate = self;
        self.customScaleViewController.delegate = self;
        self.customScaleViewController.view.hidden = YES;
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
            break;
        case 2:
            self.delegate.newInstrument = @"DistortedGuitar";
        default: break;
        break;
    }
}

-(IBAction)randomizePressed: (id) sender {
    if(!self.delegate.randomized) {
        [sender setTitle:@"De-randomize" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"Randomize" forState:UIControlStateNormal];
    }
    self.delegate.randomized = !self.delegate.randomized;
}

- (void)viewDidLoad {
    self.changeScaleViewController = nil;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.scaleLabel = nil;
}

- (void)dealloc {
    [scaleLabel release];
    [changeScaleViewController release];
    [customScaleViewController release];
    [super dealloc];
}


@end
