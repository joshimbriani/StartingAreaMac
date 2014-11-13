//
//  MainViewController.m
//  StartingArea
//
//  Created by Josh Imbriani on 11/12/14.
//  Copyright (c) 2014 Josh Imbriani. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong) IBOutlet NSTableView *heroclixTV;
@property (nonatomic) NSArray *hcHardCode;
@property (weak) IBOutlet NSTextField *name;

@end

@implementation MainViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    //Temporarily hard code some heroclix in here
    
    NSDictionary *hc1 = @{@"name" : @"Spider-Man", @"pointValue" : @56};
    
    NSDictionary *hc2 = @{@"name" : @"Superman", @"pointValue" : @200};
    
    NSDictionary *hc3 = @{@"name" : @"Wolverine", @"pointValue" : @100};
    
    [self setHcHardCode:@[hc1, hc2, hc3]];
    
    [[self heroclixTV] setDelegate:self];
    [[self heroclixTV] setDataSource:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return self.hcHardCode.count;
}

-(NSView *) tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *result = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"hcRow"]) {
        result.textField.stringValue = [self.hcHardCode objectAtIndex:row][@"name"];
        return result;
    }

    return result;
}

-(void) tableViewSelectionDidChange:(NSNotification *)notification {
    
    NSInteger selectedRow = [self.heroclixTV selectedRow];
    self.name.stringValue = [self.hcHardCode objectAtIndex:selectedRow][@"name"];
    
}

@end
