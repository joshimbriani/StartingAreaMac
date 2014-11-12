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
@property (nonatomic) NSArray *test;

@end

@implementation MainViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setTest: @[@"Test", @"test2"]];
    [[self heroclixTV] setDelegate:self];
    [[self heroclixTV] setDataSource:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return self.test.count;
}

-(NSView *) tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTextField *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    if (result == nil) {
        result = [[NSTextField alloc] initWithFrame:NSMakeRect(1, 1, 1, 1)];
        [result setBezeled:NO];
        result.identifier = @"MyView";
    }
    
    result.stringValue = [self.test objectAtIndex:row];
    
    return result;
}

@end
