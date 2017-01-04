//
//  FirstView.h
//  DemoCollectionView
//
//  Created by Ruchika on 29/08/14.
//  Copyright (c) 2014 Ruchika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstView : UICollectionViewCell
{
    IBOutlet NSLayoutConstraint *imageViewHeightConstraint;
    IBOutlet NSLayoutConstraint *itemLblHeightConstraint;

}
@property(nonatomic, strong)  IBOutlet UIImageView *itemImageView;
@property (nonatomic, strong) IBOutlet UILabel *itemDescLbl;


-(void)fillWithObject:(NSDictionary *)object;

@end
