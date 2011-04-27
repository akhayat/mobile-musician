//
//  MobileMusicianViewController.m
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteViewController.h"
#import "MenuViewController.h"


// Another declaration of the NoteViewController interface
// Allows for private methods
@interface NoteViewController()
-(void) updateButtons;
-(void) updateNotes;
-(void) updateUI;
@end


@implementation NoteViewController

@synthesize root, currentScale, notes, noteButtons, player;
@synthesize menuViewController;
@synthesize displayNames, instrument, newInstrument;

//Play a note when the button is pressed
-(IBAction)notePressed: (id) sender {
    int sound = ((UIControl*)sender).tag; 
    [self.player playNote:sound gain:1.0f];
}

// If the menu is nil, create it.
// If it's hidden, make it visible.
// If it's visible, hide it.
-(IBAction)menuButtonPressed: (id) sender {
    if (self.menuViewController == nil) {
        self.menuViewController = [[MenuViewController alloc]
                                   initWithNibName:@"MenuViewController" bundle:nil];
        self.menuViewController.delegate = self;
        [self.view addSubview: self.menuViewController.view];
    } else {
        if(!self.menuViewController.view.hidden) {
            [self updateUI];
        }
        self.menuViewController.view.hidden = !self.menuViewController.view.hidden;
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
// Draw the note buttons.
-(void)viewDidLoad {
    
	//Initialize all the properties
    self.currentScale = [[Scale alloc] initWithChromaticScale];
    self.noteButtons = [NSMutableArray array];
    self.root = [[Note alloc] initWithName:A  andOctave:3];
    self.notes = [NSMutableArray array];
    self.menuViewController == nil;
    self.displayNames = YES;
    player = [[SoundBankPlayer alloc] init];
    self.newInstrument = @"Piano";
    self.instrument = nil;
	
    int x = 0;
    int y = 0;
    int horizontalSpace = (self.view.frame.size.width - ((BUTTONS_PER_ROW) * BUTTON_SIDE)) / (BUTTONS_PER_ROW - 1);
    int verticalSpace = (self.view.frame.size.height - ((BUTTONS_PER_COLUMN) * BUTTON_SIDE)) / (BUTTONS_PER_COLUMN - 1);
    int width = horizontalSpace + BUTTON_SIDE;
    int height = verticalSpace + BUTTON_SIDE;
    
    //Loop to create and place all the buttons
    //As well as set touch events.  
    for(int i = 0; i < NUMBER_OF_BUTTONS; i++) { 
        UIButton *nextNoteButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        nextNoteButton.frame = CGRectMake(x, y, BUTTON_SIDE, BUTTON_SIDE);
		
        [nextNoteButton addTarget:self action:@selector(notePressed:)
                 forControlEvents:UIControlEventTouchDown];
        
        [self.noteButtons addObject: nextNoteButton];
        [self.view addSubview: [self.noteButtons objectAtIndex:i]];
		
		// Instead of starting a new row at the beginning,
		// the next note is directly below the one at the end
		// of the line then it reverses directions
        if ((y / height) % 2 == 0) {
            x + width >= self.view.frame.size.width ? (y += height) : (x += width);
        }
        else {
            x - width < 0 ? (y += height) : (x -= width);
        }
    }
	
    [self updateUI];
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

-(void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

//Updates the notes when the scale changes
-(void)updateNotes {
    [self.notes removeAllObjects];
    int octavesInGrid = NUMBER_OF_BUTTONS / [currentScale.halfSteps count] + 1;
    Note *nextRoot = [[Note alloc] initWithName: self.root.name andOctave: self.root.octave];
    for (int i = 0; i < octavesInGrid; i++) {
        [self.notes addObjectsFromArray: [self.currentScale toArrayOfNotesFromRoot:nextRoot]];
        [self.notes removeLastObject];
        nextRoot = [[Note alloc] initWithName: nextRoot.name andOctave: nextRoot.octave+1];
    }
    nextRoot = nil;
}

// Change the title and tag of the buttons in case
// The scale or root changed.
-(void) updateButtons {
    for (int i = 0; i < [self.noteButtons count]; i++) {
        UIButton *nextNoteButton = [self.noteButtons objectAtIndex: i];
        Note *nextNote = [self.notes objectAtIndex: i];
        NSString *title = self.displayNames ? [NSString stringWithFormat: @"%@", [nextNote nameAsString]] : @"";
        nextNoteButton.tag = nextNote.midiNumber;
        [nextNoteButton setTitle: title forState:UIControlStateNormal];
        title = nil;
    }
}

- (void)updateInstrument {
    if (![self.instrument isEqualToString: self.newInstrument]) {
        self.instrument = [[NSString stringWithFormat:@"%@", self.newInstrument] retain];
        [player setSoundBank: self.instrument];
    }
}

//Calls all of the update functions
- (void) updateUI {
    [self updateNotes];
    [self updateButtons];
    [self updateInstrument]; 
}

- (void)dealloc {
    [currentScale release];
    [notes release];
    [noteButtons release];
    [menuViewController release];
    [root release];
    [currentScale release];
    [player release];
    [instrument release];
    [newInstrument release];
    [super dealloc];
}

@end
