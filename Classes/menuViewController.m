//
//  menuViewController.m
//  MoviePlayer
//
//  Created by Chris on 12/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "menuViewController.h"
#import "MoviePlayerAppDelegate.h"
#import "infoController.h"
#import "menuCell.h"

@implementation menuViewController

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
	
	
	
	mMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[self movieURL:1]];
	[self initMoviePlayer];
	
	
	
    
	// delay while user looks at exciting splash screen
	[NSThread sleepForTimeInterval:1.5];

	
	NSLog(@"Got here...");
	
	self.title = @"WaterTime";
	
	UIButton * infoDarkButtonType = [UIButton buttonWithType:UIButtonTypeInfoLight];
	infoDarkButtonType.frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
	infoDarkButtonType.backgroundColor = [UIColor clearColor];
	[infoDarkButtonType addTarget:self action:@selector(doInfo:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithCustomView:infoDarkButtonType];
	self.navigationItem.rightBarButtonItem = infoButton;

	
	
	
	
	
	[super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)doInfo:(id)sender
{
	InfoController *infoController = [[InfoController alloc] initWithNibName:@"InfoController" bundle:nil];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:infoController];
	
	// [self.navigationController presentModalViewController:navController animated:YES];
	[self presentModalViewController:navController animated:YES];
	
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (CGFloat) tableView:(UITableView *) tableView
heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
	return 105.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
	
	static NSString *menuCellIdentifier = @"menuCellId";
	menuCell *myMenuCell = (menuCell *) [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
	if (myMenuCell == nil)
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"menuCell" owner:self options:nil];
		myMenuCell = nib[0];
	}
    
    // Set up the cell...
	
	NSInteger row = [indexPath row];
	
	UIImage *menuImage;
	
	switch (row)
	{
		case (0): // Spring
			menuImage = [UIImage imageNamed:@"Watertime_vernal_equinox_txt.jpg"];
			break;
		case (1): // Summer
			menuImage = [UIImage imageNamed:@"Watertime_summersolstice_txt.jpg"];
			break;
		case (2): // Autumn
			menuImage = [UIImage imageNamed:@"Watertime_autumnalEquinox_txt.jpg"];
			break;
		case (3): // Winter
			menuImage = [UIImage imageNamed:@"Watertime_wintersolstice_txt.jpg"];			
	}
	
	myMenuCell.imageCell.image = menuImage;
	myMenuCell.imageCell.hidden = NO;
	myMenuCell.selectionStyle = UITableViewCellSelectionStyleBlue;
    myMenuCell.backgroundColor = [UIColor blackColor];
	
	
    return myMenuCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	
    if (mMoviePlayer != nil) {
		[self deallocMoviePlayer];
	}
		
	mMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[self movieURL:indexPath.row + 1]];
	[self initMoviePlayer];
		
    [mMoviePlayer.view setFrame: self.view.bounds];  // player's frame must match parent's
    [self.view addSubview: mMoviePlayer.view];
    
	[mMoviePlayer play];
	
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark Movie Player Routines


//  Notification called when the movie finished preloading.
- (void) moviePreloadDidFinish:(NSNotification*)notification
{
    /* 
	 < add your code here >
	 */
}

//  Notification called when the movie finished playing.
- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    /*     
	 < add your code here >
	 
	 For example:
	 MPMoviePlayerController* theMovie=[aNotification object];
	 etc.
	 */
	[self performSelector:@selector(didRotate:)];	
	
}

//  Notification called when the movie scaling mode has changed.
- (void) movieScalingModeDidChange:(NSNotification*)notification
{
    /* 
	 < add your code here >
	 
	 For example:
	 MPMoviePlayerController* theMovie=[aNotification object];
	 etc.
	 */
}


-(void)initMoviePlayer
{
    /*
	 
	 Because it takes time to load movie files into memory, MPMoviePlayerController
	 automatically begins loading your movie file shortly after you initialize a new 
	 instance. When it is done preloading the movie file, it sends the
	 MPMoviePlayerContentPreloadDidFinishNotification notification to any registered 
	 observers. If an error occurred during loading, the userInfo dictionary of the 
	 notification object contains the error information. If you call the play method 
	 before preloading is complete, no notification is sent and your movie begins 
	 playing as soon as it is loaded into memory.
	 
	 */
	
    // Register to receive a notification when the movie is in memory and ready to play.
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePreloadDidFinish:) 
												 name:MPMoviePlayerContentPreloadDidFinishNotification 
											   object:nil];
    /*
	 
	 Now create a MPMoviePlayerController object using the movie file provided in our bundle.
	 
	 The MPMoviePlayerController class supports any movie or audio files that already play 
	 correctly on an iPod or iPhone. For movie files, this typically means files with the extensions 
	 .mov, .mp4, .mpv, and .3gp and using one of the following compression standards:
	 
	 - H.264 Baseline Profile Level 3.0 video, up to 640 x 480 at 30 fps. Note that B frames 
	 are not supported in the Baseline profile.
	 
	 - MPEG-4 Part 2 video (Simple Profile)
	 
	 If you use this class to play audio files, it displays a black screen while the audio plays. For 
	 audio files, this class class supports AAC-LC audio at up to 48 kHz.
	 
	 */
	
    	
    /*
	 In addition to the MPMoviePlayerContentPreloadDidFinishNotification notification,
	 the MPMoviePlayerPlaybackDidFinishNotification notification is sent to
	 registered observers when the movie has finished playing, and the 
	 MPMoviePlayerScalingModeDidChangeNotification notification is sent when the 
	 movie scaling mode has changed.
	 */
    
    // Register to receive a notification when the movie has finished playing. 
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:mMoviePlayer];
	
    // Register to receive a notification when the movie scaling mode has changed. 
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(movieScalingModeDidChange:) 
												 name:MPMoviePlayerScalingModeDidChangeNotification 
											   object:mMoviePlayer];
	
    /* Set movie player settings (scaling, controller type and background color) to the currently set values
	 as specified in the Settings application */
	
    /* 
	 Movie scaling mode can be one of: MPMovieScalingModeNone, MPMovieScalingModeAspectFit,
	 MPMovieScalingModeAspectFill, MPMovieScalingModeFill.
	 */
    MoviePlayerAppDelegate *appDelegate = (MoviePlayerAppDelegate *)[[UIApplication sharedApplication] delegate];
    mMoviePlayer.scalingMode = appDelegate.scalingMode;
    
    /* 
	 Movie control mode can be one of: MPMovieControlModeDefault, MPMovieControlModeVolumeOnly,
	 MPMovieControlModeHidden.
	 */
    mMoviePlayer.movieControlMode = appDelegate.controlMode;
	
    /*
	 The color of the background area behind the movie can be any UIColor value.
	 */
    UIColor *colors[15] = {[UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor whiteColor], 
        [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], 
        [UIColor yellowColor], [UIColor magentaColor],[UIColor orangeColor], [UIColor purpleColor], [UIColor brownColor], 
	[UIColor clearColor]};
    mMoviePlayer.backgroundColor = colors[ [appDelegate backgroundColor] ];
	
    /*
	 Register as an observer of the "overlayViewTouch" notification.
	 
	 Any user touches to the MyOverlayView (not in the button) will
	 result in the "overlayViewTouch" notification being posted, and
	 the overlayViewTouches: method in this class will be called
	 
	 
	 [[NSNotificationCenter defaultCenter] 
	 addObserver:self 
	 selector:@selector(overlayViewTouches:) 
	 name:OverlayViewTouchNotification 
	 object:nil];
	 
	 */
	
//	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];	
//	[[NSNotificationCenter defaultCenter] addObserver:self
//											 selector:@selector(didRotate:)
//												 name:UIDeviceOrientationDidChangeNotification object:nil];	
//	
//	[self performSelector:@selector(didRotate:)];	
	
	
	// [mMoviePlayer play];
	
	
}

//- (void) didRotate:(NSNotification *)notification
//{	
//	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
//	
//	if (orientation >= UIDeviceOrientationPortrait && orientation <= UIDeviceOrientationLandscapeRight)
//	{
//	//	[mMoviePlayer setOrientation:orientation animated:NO];			   undocumented, so can't use
//	}
//	
//	
//	
//}



-(IBAction)playMovie:(id)sender
{
	
	
	
	// delay while user looks at exciting highlighed circle
	//[NSThread sleepForTimeInterval:.7];
	
	
	
	
    /*
	 
     As soon as you call the play: method, the player initiates a transition that fades 
     the screen from your current window content to the designated background 
     color of the player. If the movie cannot begin playing immediately, the player 
     object continues displaying the background color and may also display a progress 
     indicator to let the user know the movie is loading. When playback finishes, the 
     player uses another fade effect to transition back to your window content.
     
     */
	
    [mMoviePlayer play];
    
    /*
	 
	 Once the movie window has been created and started playing we will add our overlay
	 view as a subview and it will be displayed above the movie view. This will allow
	 us to display any controls on top of the movie as it plays.
	 
	 
	 
	 NSArray *windows = [[UIApplication sharedApplication] windows];
	 // Locate the movie player window
	 UIWindow *moviePlayerWindow = [windows objectAtIndex:1];
	 // Add our overlay view to the movie player's subviews so it’s 
	 // displayed above it.
	 [moviePlayerWindow addSubview:mOverlayView];
	 
	 */
}



// return a URL for the movie file in our bundle
-(NSURL *)movieURL:(NSInteger) movieNum;
{
	
        NSBundle *bundle = [NSBundle mainBundle];
        if (bundle) 
        {
            NSString *moviePath = [bundle pathForResource:[NSString stringWithFormat:@"WT_mov%d", movieNum] ofType:@"m4v"];
			
            if (moviePath)
            {
                mMovieURL = [NSURL fileURLWithPath:moviePath];
            }
        }
    
    return mMovieURL;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// Touches in the MyOverlayView (not in the overlay button)
// post the "overlayViewTouch" notification and will send
// the overlayViewTouches: message
- (void)overlayViewTouches:(NSNotification *)notification
{
    // Handle touches to the MyOverlayView here... 
}

// Action method for the MyOverlayView button
-(IBAction)overlayViewButtonPress:(id)sender
{
    // Handle touches to the MyOverlayView 
    // button here... 
}

- (void)dealloc {
	
    
		
		if (mMoviePlayer !=nil) [self deallocMoviePlayer];	
		
    }

		
- (void)deallocMoviePlayer {		
		
		
		// remove movie notifications
		[[NSNotificationCenter defaultCenter] removeObserver:self
														name:MPMoviePlayerContentPreloadDidFinishNotification
													  object:nil];
		[[NSNotificationCenter defaultCenter] removeObserver:self
														name:MPMoviePlayerPlaybackDidFinishNotification
													  object:mMoviePlayer];
		[[NSNotificationCenter defaultCenter] removeObserver:self
														name:MPMoviePlayerScalingModeDidChangeNotification
													  object:mMoviePlayer];
		
		/*
		 [[NSNotificationCenter defaultCenter] removeObserver:self
		 name:OverlayViewTouchNotification
		 object:mMoviePlayer];       */
		
		[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];		
		// free our movie player
		
		
		
}		
		
		
		
		
		
		
		
@end

