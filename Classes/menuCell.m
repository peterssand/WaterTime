//
//  menuCell.m
//  MoviePlayer
//
//  Created by Developer on 12/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "menuCell.h"


@implementation menuCell

@synthesize imageCell;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

		[super setSelected:selected animated:animated];   
		if (selected == YES)
			imageCell.alpha = .5;
		else
			imageCell.alpha = 1;
	
	
}




@end
