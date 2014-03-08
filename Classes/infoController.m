//
//  InfoController.m
//  WaterTime
//
//  Created by Rick Knoblaugh on 3/30/09.
//  Copyright 2009 Hodge Arts_. All rights reserved.
//

#import "InfoController.h"

@implementation InfoController

// @synthesize pickerData;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	[super viewDidLoad];
	
	
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

- (void) cancelAction:(id)sender {
	NSLog(@"Cancelling Match Score");
	[[self navigationController] dismissModalViewControllerAnimated:YES];
	//[[self navigationController] popToRootViewControllerAnimated:YES];
}


- (void) emailAction:(id)sender {


	
//	NSString *url = [NSString stringWithString: @"mailto:rknoblaugh@earthlink.net?&subject=Cool%20iPhone%20Application!&body=Check%20out%20the%20cool%ocean%20footage!"];
//	NSString *url = [NSString stringWithString: @"mailto:rknoblaugh@earthlink.net?&subject=Cool%20iPhone%20Application!&body=Check%20out%20WaterTime!"];
//	NSString *url = [NSString stringWithString: @"mailto:?&subject=Cool%20iPhone%20Application!&body=Check%20out%20WaterTime!"];
	
    NSString *url = @"mailto:?&subject=Tell%20a%20friend%20about%20WaterTime&body=People%20everywhere%20are%20drawn%20to%20sit%20and%20stare%20at%20the%20ocean.%20Its%20changing%20face,%20its%20crushing%20power,%20and%20its%20sheer%20vastness%20are%20inescapable.%20To%20capture%20a%20sense%20of%20its%20immensity,%20influence,%20and%20ability%20to%20connect%20the%20world,%20the%20Hodges%20filmed%20the%20same%20stretch%20of%20ocean%20in%20Miramar,%20California,%20every%20day,%20at%20the%20same%20time,%20for%20an%20entire%20year.%20This%20footage%20was%20then%20edited%20into%20an%20appealing%20film%20that%20captures%20changing%20colors,%20wave%20patterns,%20and%20reflections%20of%20the%20sea,%20sky,%20and%20beach.";
	
	
	
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];	

}



// process when user touches URL -- invoke Safari and take them to Hodge Arts


- (void) webAction: (id) sender {

[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.hodgearts.com"]];


}







@end

