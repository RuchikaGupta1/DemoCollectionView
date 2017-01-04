//
//  FirstViewController.h
//  DemoCollectionView
//
//  Created by Ruchika on 29/08/14.
//  Copyright (c) 2014 Ruchika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

@interface FirstViewController : UIViewController<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
{
   IBOutlet UICollectionView *collectionView;
    
    NSMutableArray *itemArray;
    
    NSMutableArray *cellSizes;
    
}

@end
