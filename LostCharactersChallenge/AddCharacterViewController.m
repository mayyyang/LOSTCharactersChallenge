//
//  AddCharacterViewController.m
//  LostCharactersChallenge
//
//  Created by May Yang on 11/11/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "AddCharacterViewController.h"
#import "AppDelegate.h"

@interface AddCharacterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *actorTextField;
@property (weak, nonatomic) IBOutlet UITextField *passengerTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *seatNumberTextField;

@end

@implementation AddCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.passengerTextField.placeholder = [self.characters valueForKey:@"passenger"];
    self.actorTextField.placeholder = [self.characters valueForKey:@"actor"];
    self.genderTextField.placeholder = [self.characters valueForKey:@"gender"];
    self.hairColorTextField.placeholder = [self.characters valueForKey:@"hair_color"];
    self.eyeColorTextField.placeholder = [self.characters valueForKey:@"eye_color"];
    self.seatNumberTextField.placeholder = [self.characters valueForKey:@"seat"];

}



- (IBAction)onButtonSaved:(UIButton *)sender
{
    if (self.characters == nil)
    {
        NSManagedObject *newCharacter = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.moc];
        [newCharacter setValue:self.actorTextField.text forKey:@"actor"];
        [newCharacter setValue:self.passengerTextField.text forKey:@"passenger"];
        [newCharacter setValue:self.genderTextField.text forKey:@"gender"];
        [newCharacter setValue:[NSNumber numberWithInt:[self.ageTextField.text intValue]] forKey:@"age"]; //convert to int, then convert to NSNumber
        [newCharacter setValue:self.hairColorTextField.text forKey:@"hair_color"];
        [newCharacter setValue:self.eyeColorTextField.text forKey:@"eye_color"];
        [newCharacter setValue:self.seatNumberTextField.text forKey:@"seat"];

    [self.moc save:nil];

    NSLog(@"%@", newCharacter);
    }
}


@end
