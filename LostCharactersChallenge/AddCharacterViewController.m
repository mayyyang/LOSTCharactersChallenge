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
    self.passengerTextField.placeholder = [self.lostCharacter valueForKey:@"passenger"];
    self.actorTextField.placeholder = [self.lostCharacter valueForKey:@"actor"];
    self.genderTextField.placeholder = [self.lostCharacter valueForKey:@"gender"];
    self.hairColorTextField.placeholder = [self.lostCharacter valueForKey:@"hair_color"];
    self.eyeColorTextField.placeholder = [self.lostCharacter valueForKey:@"eye_color"];
    self.seatNumberTextField.placeholder = [self.lostCharacter valueForKey:@"seat"];
    //TODO: need to figure out how to do age text field


//
// [m setValue:[NSNumber numberWithInt:[self.ageTextField.text intValue]] forKey:@"age"];

}


- (IBAction)onCharacterAdd:(UITextField *)sender
{

}

- (IBAction)onPassengerAdd:(UITextField *)sender
{

}

- (IBAction)onButtonSaved:(UIButton *)sender
{
        NSManagedObject *m = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.moc];
        [m setValue:self.actorTextField.text forKey:@"actor"];
        [m setValue:self.passengerTextField.text forKey:@"passenger"];
        [m setValue:self.genderTextField.text forKey:@"gender"];
        [m setValue:[NSNumber numberWithInt:[self.ageTextField.text intValue]] forKey:@"age"]; //convert to int, then convert to NSNumber
        [m setValue:self.hairColorTextField.text forKey:@"hair_color"];
        [m setValue:self.eyeColorTextField.text forKey:@"eye_color"];
        [m setValue:self.seatNumberTextField.text forKey:@"seat"];

    [self.moc save:nil];

    NSLog(@"%@", m);
}


@end
