//
//  MobileMusicianAppDelegate.h
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteViewController;

@interface MobileMusicianAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NoteViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NoteViewController *viewController;

@end

