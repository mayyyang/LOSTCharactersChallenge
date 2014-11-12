//
//  ViewController.m
//  LostCharactersChallenge
//
//  Created by May Yang on 11/11/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"
#import "AddCharacterViewController.h"
#import "CustomTableViewCell.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSManagedObjectContext *moc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *charactersArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    self.moc = delegate.managedObjectContext;


}

- (void) viewDidAppear:(BOOL)animated
{
    self.charactersArray = [self load];

    if(self.charactersArray.count == 0){

        [self loadDataFromPropertyList];
        self.charactersArray = [self load];

    }

    [self.tableView reloadData];

}

- (void)loadDataFromPropertyList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];

    for (NSDictionary *dict in items)
    {
        NSManagedObject *m = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.moc];
        [m setValuesForKeysWithDictionary:dict];
    }

    NSError *err = nil;
    [self.moc save:&err];

    if (err != nil)
    {
        NSLog(@"error saving managed object context: %@", err);
    }

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSManagedObject *lost = self.charactersArray[indexPath.row];

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.textLabel.text = [lost valueForKey:@"actor"];
    cell.detailTextLabel.text = [lost valueForKey:@"passenger"];

    //TODO: Add Editing function so that labels show up for LOST characters.
    cell.ageLabel.text = [NSString stringWithFormat:@"%@",[lost valueForKey:@"age"]];
//    cell.ageLabel.text = nil;
    cell.eyeLabel.text = [lost valueForKey:@"eye_color"];
    cell.sexLabel.text = [lost valueForKey:@"gender"];
    cell.hairLabel.text = [lost valueForKey:@"hair_color"];
    cell.seatLabel.text = [lost valueForKey:@"seat"];


    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.charactersArray.count;
//}
}
- (NSArray *)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Lost"];


    //sorting the table by the name
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    request.sortDescriptors = @[sortByName];

    //puts stuff in charactersArray
    return [self.moc executeFetchRequest:request error:nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddCharacterViewController *vc = segue.destinationViewController;
    vc.moc = self.moc;

    if ([segue.identifier isEqualToString:@"editSegue"]) {
        vc.lostCharacter = self.charactersArray[[self.tableView indexPathForSelectedRow].row];
    }

}

//- (IBAction)unwindFromAddCharacterViewController:(UIStoryboardSegue *)segue
//{
//
//    
//}
//

@end
