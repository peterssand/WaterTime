//
//  menuViewController.h
//  MoviePlayer
//
//  Created by Chris on 12/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface menuViewController : UITableViewController 
	<UITableViewDelegate, UITableViewDataSource> {
		
		
		MPMoviePlayerController *mMoviePlayer;
		NSURL *mMovieURL;
		
	
		
		
		
}

-(NSURL *)movieURL:(NSInteger) movieNum;
-(void)initMoviePlayer;
- (void)deallocMoviePlayer;
-(IBAction)playMovie:(id)sender;

@end
