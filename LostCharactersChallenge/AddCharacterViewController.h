//
//  AddCharacterViewController.h
//  LostCharactersChallenge
//
//  Created by May Yang on 11/11/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddCharacterViewController : UIViewController
@property NSManagedObjectContext *moc;
@property NSManagedObject *lostCharacter;

@end
