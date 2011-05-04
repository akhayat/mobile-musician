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
+(NSMutableArray *) randomizeArray: (NSMutableArray *)initialArray;
@end

@implementation NoteViewController

@synthesize root, currentScale, notes, noteButtons, player;
@synthesize menuViewController, recordButton;
@synthesize displayNames, instrument, newInstrument, recorder, recording, startTime, randomized;

//Play a note when the button is pressed
-(IBAction) notePressed: (id) sender {
    int sound = ((UIControl*)sender).tag; 
    [self.player playNote:sound gain:1.0f];
    //If we're recording, capture the note and record the time between the last hit
    if (self.recording) {
        if ([self.recorder totalRecordTime] > MAX_RECORD_TIME) {
            [self toggleRecord];
        } else {
            [self.recorder recordNoteWithMidiNumber:sound andDelay: fabs([startTime timeIntervalSinceNow])];
            self.startTime = [NSDate date];
        }
    }
}

-(IBAction) recordPressed: (id) sender {
    [self toggleRecord];
}

-(void) toggleRecord {
    if (self.menuViewController.view.hidden) {
        if (self.recording) {
            [self.recorder saveSequence];
            [self.recordButton setTitle:@"Record"];
        } else {
            [self.recordButton setTitle:@"Stop"];
            [self.recorder clearSequence];
            self.startTime = [NSDate date];
        }
        self.recording = !self.recording;
    }
}

-(IBAction) playPressed: (id) sender {
    if (!self.recording && !recorder.playing) {
        [self.recorder playSequenceWithSoundBank: self.player];
    }
}

// If it's hidden, make it visible.
// If it's visible, hide it.
// You can't open the menu during recording
-(IBAction) menuButtonPressed: (id) sender {
    if(!self.recording) {
        if (!self.menuViewController.view.hidden) {
            [self updateUI];
        }
        self.menuViewController.view.hidden = !self.menuViewController.view.hidden;
     }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
// Draw the note buttons.
-(void)viewDidLoad {
    
	//Initialize all the properties
    self.currentScale = [[Scale alloc] initWithChromaticScale];
    self.noteButtons = [NSMutableArray array];
    self.root = [[Note alloc] initWithName:A  andOctave:4];
    self.notes = [NSMutableArray array];
    self.menuViewController == nil;
    self.displayNames = YES;
    player = [[SoundBankPlayer alloc] init];
    self.newInstrument = @"Piano";
    self.recording = NO;
    self.randomized = NO;
    self.recorder = [[Recorder alloc] init];
    self.instrument = nil;
    
    //initialize local variables
    int x = 0;
    int y = 0;
    int horizontalSpace = (self.view.frame.size.width - ((BUTTONS_PER_ROW) * BUTTON_SIDE)) / (BUTTONS_PER_ROW - 1);
    int verticalSpace = (self.view.frame.size.height - ((BUTTONS_PER_COLUMN) * BUTTON_SIDE)) / (BUTTONS_PER_COLUMN - 1);
    int width = horizontalSpace + BUTTON_SIDE;
    int height = verticalSpace + BUTTON_SIDE;
    
    //Loop to create and place all the buttons
    //As well as set touch events.  
    for(int i = 0; i < NUMBER_OF_BUTTONS; i++) { 
        UIButton *nextNoteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
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
    
    //Initialize the menuviewcontroller
    self.menuViewController = [[MenuViewController alloc]
                               initWithNibName:@"MenuViewController" bundle:nil];
    self.menuViewController.delegate = self;
    [self.view addSubview: self.menuViewController.view];
    self.menuViewController.view.hidden = YES;
    
    [super viewDidLoad];
}

-(void) didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

//Updates the notes when the scale changes
-(void) updateNotes {
    [self.notes removeAllObjects];
    int octavesInGrid = NUMBER_OF_BUTTONS / [self.currentScale.halfSteps count] + 1;
    Note *nextRoot = [[Note alloc] initWithName: self.root.name andOctave: self.root.octave];
    NSMutableArray *nextArray;
    for (int i = 0; i < octavesInGrid; i++) {
        nextArray = [NSMutableArray arrayWithArray:[self.currentScale toArrayOfNotesFromRoot:nextRoot]];
        [nextArray removeLastObject];
        //Randomize the order if the randomize button is selected
        if (self.randomized) nextArray = [NoteViewController randomizeArray: nextArray];
        [self.notes addObjectsFromArray: nextArray];
        [nextRoot autorelease];
        nextRoot = [[Note alloc] initWithName: nextRoot.name andOctave: nextRoot.octave+1];
    }
    [nextRoot release];
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

- (void) updateInstrument {
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

// Copies an array and returns it with randomly arranged elements
+(NSMutableArray *) randomizeArray: (NSMutableArray *)initialArray {
    NSMutableArray *randomArray = [[NSMutableArray arrayWithArray:initialArray] retain];
    [initialArray enumerateObjectsUsingBlock: ^(id currentItem, NSUInteger i, BOOL *stop) {
        [randomArray exchangeObjectAtIndex: i withObjectAtIndex: arc4random() % [randomArray count]];
    }];
    [randomArray autorelease];
    return randomArray;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.recordButton = nil;
}

- (void) dealloc {
    [recordButton release];
    [currentScale release];
    [notes release];
    [noteButtons release];
    [menuViewController release];
    [root release];
    [currentScale release];
    [player release];
    [instrument release];
    [newInstrument release];
    [startTime release];
    [recorder release];
    [super dealloc];
}

@end
