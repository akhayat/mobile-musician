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
@synthesize currentScale;
@synthesize notes;
@synthesize noteButtons;
@synthesize player;

MenuViewController *menuViewController = nil;

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self.view];
    NSLog(@"x: %f, y: %f", location.x, location.y);
}*/

//Play a note when the button is pressed
-(IBAction)notePressed: (id) sender {
    int sound = ((UIControl*)sender).tag; 
	[player playNote:sound gain:1.0f];
}

// If the menu is nil, create it.
// If it's hidden, make it visible.
// If it's visible, hide it.
-(IBAction)menuButtonPressed: (id) sender {
	if (menuViewController == nil) {
        menuViewController = [[MenuViewController alloc]
							    initWithNibName:@"MenuViewController" bundle:nil];
	    [self.view addSubview: menuViewController.view];
	} else {
		menuViewController.view.hidden = !menuViewController.view.hidden;
	}
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
// Draw the note buttons.
- (void)viewDidLoad {

	self.currentScale = [[Scale alloc] initWithChromaticScale];
	self.noteButtons = [NSMutableArray array];
	self.root = [[Note alloc] initWithName:A  andOctave:2];
	self.notes = [NSMutableArray array];
	
	int i;
	int x = 0;
	int y = 0;
	int horizontalSpace = (self.view.frame.size.width - ((BUTTONS_PER_ROW) * BUTTON_SIDE)) / (BUTTONS_PER_ROW - 1);
	int verticalSpace = (self.view.frame.size.height - ((BUTTONS_PER_COLUMN) * BUTTON_SIDE)) / (BUTTONS_PER_COLUMN - 1);
	int width = horizontalSpace + BUTTON_SIDE;
	int height = verticalSpace + BUTTON_SIDE;
	int numberOfButtons = BUTTONS_PER_ROW * BUTTONS_PER_COLUMN;
	int octavesInGrid = numberOfButtons / [currentScale.halfSteps count] + 1;
	Note *nextRoot = [[Note alloc] initWithName: root.name andOctave: root.octave];
	
	
	//Initialize the notes
	for (i = 0; i < octavesInGrid; i++) {
	    [self.notes addObjectsFromArray: [self.currentScale toArrayOfNotesFromRoot:nextRoot]];
		[self.notes removeLastObject];
		nextRoot.octave++;

	}
	[nextRoot release];
	
	//NSLog(@"NOTE COUNT: %d", [self.notes count]);
	player = [[SoundBankPlayer alloc] init];
	[player setSoundBank:@"Piano"];
	
	for(i = 0; i < numberOfButtons; i++) { 
		UIButton *nextNoteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		Note *nextNote = [self.notes objectAtIndex: i];
		nextNoteButton.frame = CGRectMake(x, y, BUTTON_SIDE, BUTTON_SIDE);
		NSString *title = [NSString stringWithFormat: @"%@", [nextNote nameAsString]];
		[nextNoteButton setTitle:title forState: UIControlStateNormal];
		
		[nextNoteButton addTarget:self 
						   action:@selector(notePressed:)
		 forControlEvents:UIControlEventTouchDown];
		[nextNoteButton addTarget:self 
						   action:@selector(notePressed:)
				 forControlEvents:UIControlEventTouchDragEnter];
		
		nextNoteButton.tag = nextNote.name + 12 * nextNote.octave;
		
		[self.noteButtons addObject: nextNoteButton];
		[self.view addSubview: [self.noteButtons objectAtIndex:i]];
		
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
	NSLog(@"HERE!");
	
    [super viewDidLoad];
}

-(void)changeRoot:(Note *)newRoot {
//	for(
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
	[currentScale release];
	[player release];
    [super dealloc];
}

@end
