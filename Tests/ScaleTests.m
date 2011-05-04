//
//  ScaleTests.m
//  MobileMusician
//
//  Created by Anthony Khayat on 5/4/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "ScaleTests.h"


@implementation ScaleTest


- (void) testInit {
    
    STAssertThrows([[[Scale alloc] initWithArray:[NSArray array]] autorelease], @"Not enough half steps given, but doesn't throw exception.");
    
    NSArray *halfStepArray = [NSArray arrayWithObjects: [NSNumber numberWithInt:8], [NSNumber numberWithInt:7], nil];
    STAssertThrows([[[Scale alloc] initWithArray: halfStepArray] autorelease], 
                   @"Too many halfsteps given but no exception is thrown." );
}

- (void) testArrayOfNotes {
    Scale *testScale = [[[Scale alloc] initWithMajorScale] autorelease];
    Note *root = [[[Note alloc] initWithName: G andOctave: 1] autorelease];
    NSArray *testArray = [testScale toArrayOfNotesFromRoot: root];
    NSArray *nameArray = [NSArray arrayWithObjects: @"G", @"A", @"B", @"C", @"D", @"E", @"F#", @"G", nil];
    
   int i = 0;
    for (Note *note in testArray) {
        STAssertEquals([nameArray objectAtIndex:i], [note nameAsString], 
                       @"Note was %d, but should have been %d.", [note nameAsString], [nameArray objectAtIndex: i]);
        i++;
    }
    
    testArray = [NSArray arrayWithObjects: [NSNumber numberWithInt: 3], [NSNumber numberWithInt: 3],
                 [NSNumber numberWithInt: 3], [NSNumber numberWithInt: 3], nil];
    
    testScale = [[[Scale alloc] initWithArray:testArray] autorelease];
    root = [[[Note alloc] initWithName: E andOctave: 1] autorelease];
    testArray = [testScale toArrayOfNotesFromRoot: root];
    nameArray = [NSArray arrayWithObjects: @"E", @"G", @"A#", @"C#", @"E", nil];
    i = 0;
    for (Note *note in testArray) {
        STAssertEquals([nameArray objectAtIndex:i], [note nameAsString], 
                       @"Note was %@, but should have been %@.", [note nameAsString], [nameArray objectAtIndex: i]);
        i++;
    }
    

}

@end
