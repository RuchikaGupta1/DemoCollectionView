//
//  FirstView.m
//  DemoCollectionView
//
//  Created by Ruchika on 29/08/14.
//  Copyright (c) 2014 Ruchika. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
@synthesize itemImageView,itemDescLbl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"sdhfgwe");
//        itemImageView = [[UIImageView alloc] init];
//        itemImageView.backgroundColor = [UIColor grayColor];
//        
//        [self addSubview:itemImageView];
//        
//        itemDescLbl = [[UILabel alloc] init];
//        itemDescLbl.backgroundColor = [UIColor redColor];
//        itemDescLbl.textColor = [UIColor whiteColor];
//        itemDescLbl.lineBreakMode = NSLineBreakByWordWrapping;
//        itemDescLbl.numberOfLines = 0;
//        itemDescLbl.font = [UIFont systemFontOfSize:16];
//        itemDescLbl.textAlignment= NSTextAlignmentLeft;
//        
//        [self addSubview:itemDescLbl];
        
    }
    return self;
}


-(void)fillWithObject:(NSDictionary *)object
{
//    CGSize labelSize = [[object objectForKey:@"description"] boundingRectWithSize:CGSizeMake(145, INT_MAX)
//                                                                          options:NSStringDrawingUsesLineFragmentOrigin
//                                                                       attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}
//                                                                          context:nil].size;
    
    

//    CGRect imageViewFrame = CGRectMake(0.f, 0.f, CGRectGetMaxX(self.contentView.bounds), [[object objectForKey:@"image_height"] floatValue]);
    
//    itemImageView.frame = imageViewFrame;
    
    
    
//    itemDescLbl.frame = CGRectMake(self.contentView.bounds.origin.x, CGRectGetMaxY(itemImageView.frame),145, labelSize.height);
    
    
    itemDescLbl.text = [object objectForKey:@"description"];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
