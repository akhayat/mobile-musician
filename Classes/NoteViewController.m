//
//  MobileMusicianViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteViewController.h"
#import "MenuViewController.h"



@implementation NoteViewController

@synthesize root;
@synthesize scale;
@synthesize notes;
@synthesize player;

MenuViewController *menuViewController = nil;

-(IBAction)notePressed: (id) sender {
    int sound = ((UIControl*)sender).tag; 
	[player playNote:sound gain:1.0f];
}

-(IBAction)menuButtonPressed: (id) sender {
	if( menuViewController == nil || !menuViewController.menuVisible) {
		[menuViewController release];
        menuViewController = [[MenuViewController alloc]
							    initWithNibName:@"MenuViewController" bundle:nil];
	    [self.view addSubview: menuViewController.view];
	} else {
	    [menuViewController.view removeFromSuperview];
	}
	menuViewController.menuVisible = !menuViewController.menuVisible;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

		
    }
    return self;
}

*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
}
*/
//
//-(IBAction)setButtonTitle: (UIButton *)sender {
//	[note1 setTitle:@"AHH" forState: UIControlStateNormal];
//}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.*\

- (void)viewDidLoad {

	self.scale = [[Scale alloc] initWithArray: [NSArray arrayWithObjects: [NSNumber numberWithInt:1],
												[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
												[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
												[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
												[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
												[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], 
												[NSNumber numberWithInt:1], nil]];
	
	self.root = [[Note alloc] initWithName:A  andOctave:2];
	self.notes = [self.scale toArrayOfNotesFromRoot:root];
	
	player = [[SoundBankPlayer alloc] init];
	[player setSoundBank:@"Piano"];
	
	int i;
	int x = 0;
	int y = 0;
	int horizontalSpace = (self.view.frame.size.width - ((BUTTONS_PER_ROW) * BUTTON_SIDE)) / (BUTTONS_PER_ROW - 1);
	int verticalSpace = (self.view.frame.size.height - ((BUTTONS_PER_COLUMN) * BUTTON_SIDE)) / (BUTTONS_PER_COLUMN - 1);
	int width = horizontalSpace + BUTTON_SIDE;
	int height = verticalSpace + BUTTON_SIDE;
	
	for(i = 0; i < BUTTONS_PER_ROW * BUTTONS_PER_COLUMN; i++) { 
		UIButton *nextNoteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		Note *nextNote = [self.notes objectAtIndex:(i%([notes count]-1))];
		nextNoteButton.frame = CGRectMake(x, y, BUTTON_SIDE, BUTTON_SIDE);

		NSString *title = [NSString stringWithFormat: @"%@", [nextNote nameAsString]];
		NSLog(@"%@%f note# %f", [nextNote nameAsString], nextNote.octave, i);
		[nextNoteButton setTitle:title forState: UIControlStateNormal];
		
		[nextNoteButton addTarget:self 
						   action:@selector(notePressed:)
		 forControlEvents:UIControlEventTouchDown];
		nextNoteButton.tag = nextNote.name + 12 * (nextNote.octave + i / [self.scale.halfSteps count]);
		[self.view addSubview:nextNoteButton];
		
		
		// Instead of starting a new row at the beginning,
		// the next note is directly below the one at the end
		// of the line then it reverses directions
		if ((y / height) % 2 == 0) {
			if (x + width >= self.view.frame.size.width) {
				y += height;
			}
			else {
				x += width;
			}
		}
		else {
			if (x - width < 0) {
				y += height;
			}
			else {
				x -= width;
			}
		}
	}
    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[menuViewController release];
	[root release];
	[notes release];
	[currentScale release];
	[player release];
    [super dealloc];
}

@end