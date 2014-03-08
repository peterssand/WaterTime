//
//  InfoController.m
//  WaterTime
//
//  Created by Rick Knoblaugh on 30/09.
//  Copyright 2009 Hodge Arts_. All rights reserved.
//

#import "InfoController.h"
#import "OMTUtils.h"

@implementation InfoController

// @synthesize pickerData;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	
//	self.title = @"Score";
//	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	[super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tell a Friend" style:UIBarButtonItemStylePlain target:self action:@selector(emailAction:)];

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[scorePicker release];
    [super dealloc];
}


- (void) saveAction:(id)sender {
	NSLog(@"Saving Match Score");
	
	if (self.match != nil) {						// assuming scoreBoardController is being called to get scores for a match
	
		MTBuddyLiteAppDelegate *appDelegate = (MTBuddyLiteAppDelegate *)[[UIApplication sharedApplication] delegate];
		// Add the match to the global array of players
		[appDelegate addMatch:self.match];
	}
	
	
	
	
	[[self navigationController] dismissModalViewControllerAnimated:YES];
	//MTBuddyLiteAppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate navigationController popToRootViewControllerAnimated:YES];

//	[[self navigationController] popToRootViewControllerAnimated:YES];
}

- (void) cancelAction:(id)sender {
	NSLog(@"Cancelling Match Score");
	[[self navigationController] dismissModalViewControllerAnimated:YES];
	//[[self navigationController] popToRootViewControllerAnimated:YES];
}


- (void) emailAction:(id)sender {


	NSString* txtTo = @"rknoblaugh@earthlink.net"
	NSString* txtSubject = @"Cool iPhone App";
	NSString* txtBody = @"Check out the cool ocean footage";
	
	[OMTUtils sendEmailTo:txtTo withSubject:txtSubject withBody:txtBody];
	



}



// process when user touches URL -- invoke Safari and take them to Hodge Arts


- (void) webAction: (id) sender {





}









#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView
{
	return 2;
}

- (NSInteger) pickerView:(UIPickerView *) pickerView
numberOfRowsInComponent:(NSInteger)component
{
	return [self.pickerData count];
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView
titleForRow:(NSInteger) row
forComponent:(NSInteger) component
{
	return [self.pickerData objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return 30;
}
	
@end

