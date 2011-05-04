//
//  CustomScaleViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 5/2/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "CustomScaleViewController.h"


@implementation CustomScaleViewController

@synthesize scaleButtons, instructions, delegate;

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

-(IBAction) cancelButtonPressed: (id)sender {
	self.view.hidden = !self.view.hidden;
}

-(IBAction) scaleButtonPressed: (id) sender {
    if (!((UIButton *)sender).tag) {
        [sender setBackgroundColor: [UIColor blueColor]];
        [sender setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        ((UIButton *)sender).tag = 1;
    } else {
        [sender setBackgroundColor: [UIColor whiteColor]];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        ((UIButton *)sender).tag = 0;
        
    }
}

//Creates a new scale based on the distance between the highlighted notes
-(IBAction) donePressed: (id) sender {
    NSMutableArray *newScale = [NSMutableArray array];
    int numberOfSteps = 0;
    for (UIButton *scaleButton in self.scaleButtons) {
        if (scaleButton.tag) {
            [newScale addObject: [NSNumber numberWithInt: numberOfSteps]];
            numberOfSteps = 1;
        } else {
            numberOfSteps++;
        }
    }
    [newScale addObject: [NSNumber numberWithInt: numberOfSteps]];
    
    if ([newScale count] > MIN_NOTES - 1) {
        self.view.hidden = YES;
        self.delegate.scaleLabel.text = @"Custom";
        self.delegate.delegate.currentScale = [[Scale alloc] initWithArray:newScale];
    } else {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Not Enough Notes" message:@"You need at least 4 notes in your scale"
                                                        delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
        [alert show];
    }
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scaleButtons = [[NSMutableArray array] retain];
    
    int x = X_OFFSET;
    int y = Y_OFFSET;
    int horizontalSpace = ((self.view.frame.size.width - 2 * X_OFFSET) - ((SCALE_BUTTONS_PER_ROW) * SCALE_BUTTON_SIDE)) / (SCALE_BUTTONS_PER_ROW - 1);
    int verticalSpace = ((self.view.frame.size.height - self.instructions.frame.size.height - Y_OFFSET - PADDING) - 
                         ((SCALE_BUTTONS_PER_COLUMN) * SCALE_BUTTON_SIDE)) / (SCALE_BUTTONS_PER_COLUMN - 1);
    int width = horizontalSpace + SCALE_BUTTON_SIDE;
    int height = verticalSpace + SCALE_BUTTON_SIDE;
    Note *root = [[Note alloc] initWithName:C andOctave:0];
    
    
    for(int i = 0; i < NUMBER_OF_SCALE_BUTTONS; i++) { 
        UIButton *nextScaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        Note *nextNote = [[[Note alloc] initWithName:root.name+i andOctave:0] autorelease];
        nextScaleButton.frame = CGRectMake(x, y, SCALE_BUTTON_SIDE, SCALE_BUTTON_SIDE);
        
        if (i != 0) {
            [nextScaleButton addTarget:self action:@selector(scaleButtonPressed:)
                      forControlEvents:UIControlEventTouchDown];
            [nextScaleButton setBackgroundColor: [UIColor whiteColor]];
            [nextScaleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else {
            [nextScaleButton setBackgroundColor: [UIColor blueColor]];
            [nextScaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [nextScaleButton setTitle: [nextNote nameAsString] forState: UIControlStateNormal];
        nextScaleButton.tag = 0;
        [self.scaleButtons addObject: nextScaleButton];
        [self.view addSubview: [self.scaleButtons objectAtIndex:i]];
		
		// Similar to NoteViewController
        if ((y / height) % 2 == 0) {
            x + width >= self.view.frame.size.width - X_OFFSET ? (y += height) : (x += width);
        }
        else {
            x - width < X_OFFSET ? (y += height) : (x -= width);
        }
    }
    [root release];
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
    self.instructions = nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [instructions release];
    [scaleButtons release];
    [super dealloc];
}

@end
