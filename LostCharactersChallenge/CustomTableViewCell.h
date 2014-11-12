//
//  CustomTableViewCell.h
//  LostCharactersChallenge
//
//  Created by May Yang on 11/11/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *seatLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *hairLabel;
@property (weak, nonatomic) IBOutlet UILabel *eyeLabel;


@end
