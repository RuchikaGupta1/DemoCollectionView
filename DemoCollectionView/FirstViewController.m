//
//  FirstViewController.m
//  DemoCollectionView
//
//  Created by Ruchika on 29/08/14.
//  Copyright (c) 2014 Ruchika. All rights reserved.
//

#import "FirstViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "FirstView.h"
#import "FirstViewHeader.h"
#import "FirstViewFooter.h"

#define CELL_IDENTIFIER @"FirstView"

#define HEADER_IDENTIFIER @"FirstViewHeader"
#define FOOTER_IDENTIFIER @"FirstViewFooter"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    
//    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //set spacing from edge of screen, 10px from each edge
    
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //set spacing from edge of screen, 10px from each edge

    layout.minimumColumnSpacing = 10; // space between columns
    layout.minimumInteritemSpacing = 10; // space between rows
    
    
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, 30, self.view.bounds.size.width, self.view.bounds.size.height-30) collectionViewLayout:layout];
      collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    collectionView.dataSource = self;
    collectionView.delegate = self;
//    [collectionView registerClass:[FirstView class]
//            forCellWithReuseIdentifier:CELL_IDENTIFIER];
    
    [collectionView registerNib:[UINib nibWithNibName:CELL_IDENTIFIER bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    
    collectionView.backgroundColor = [UIColor yellowColor];
    
    [collectionView registerClass:[FirstViewHeader class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
               withReuseIdentifier:HEADER_IDENTIFIER];
    

    
    [collectionView registerClass:[FirstViewFooter class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
               withReuseIdentifier:FOOTER_IDENTIFIER];
    

    
    [self.view addSubview:collectionView];
    
    
    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"100",@"image_height",@"abcd sdfuhs",@"description",@"",@"image_url", nil];
    
    NSDictionary *dict2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"200",@"image_height",@"efg ddsdf udyqw iduyquwdy qwdutqwdy ",@"description",@"",@"image_url", nil];

    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"150",@"image_height",@"high wudyw udyqw ahdfgatdrtwdr twdywdferf ergieurg  ",@"description",@"",@"image_url", nil];

    
    NSDictionary *dict4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"170",@"image_height",@"jklmn  ",@"description",@"",@"image_url", nil];

    
    NSDictionary *dict5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"240",@"image_height",@"12242 sca stdraT drATDRra CS iduyquwdy qwdutqwdy ",@"description",@"",@"image_url", nil];

    
    NSDictionary *dict6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"190",@"image_height",@"opqrs FDYWtd yqDTW YQtwd iuyfe wueyf uwyy ",@"description",@"",@"image_url", nil];

    NSDictionary *dict7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"100",@"image_height",@"wxyz uyeq weuoei wvbxvahdffqwdjuqwi ytqwvyqtq",@"description",@"",@"image_url", nil];

    NSDictionary *dict8 = [[NSDictionary alloc] initWithObjectsAndKeys:@"120",@"image_height",@"hum adjya",@"description",@"",@"image_url", nil];
    
    NSDictionary *dict9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"175",@"image_height",@"delhi jaipur adtayy qwdutqwdy ",@"description",@"",@"image_url", nil];

    NSDictionary *dict10 = [[NSDictionary alloc] initWithObjectsAndKeys:@"220",@"image_height",@"konstant team iduyquwdy",@"description",@"",@"image_url", nil];


    
    itemArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9,dict10,nil];
    
    
}
- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
    CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)collectionView.collectionViewLayout;
    layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

- (NSMutableArray *)cellSizes {
    if (!cellSizes) {
        cellSizes = [NSMutableArray array];
        for (NSInteger i = 0; i < [itemArray count]; i++) {
            
            CGFloat height =  [[[itemArray objectAtIndex:i] objectForKey:@"image_height"] floatValue];
            
            CGSize   size = CGSizeMake(145.0f, height);
               CGSize labelSize = [[[itemArray objectAtIndex:i] objectForKey:@"description"] boundingRectWithSize:CGSizeMake(145, 900)
                                                                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                                                                    attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}
                                                                                                       context:nil].size;
            
//            size.height = size.height + labelSize.height+4;
            
            size.height = size.height + ceil(labelSize.height);

            
            cellSizes[i] = [NSValue valueWithCGSize:size];
        }
    }
    return cellSizes;
    
}

//#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [itemArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1; //or the number of sections you want
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionViewLocal cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FirstView *cell = (FirstView *)[collectionViewLocal dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    [cell fillWithObject:[itemArray objectAtIndex:indexPath.row]];
    
    return cell; //return an instance of your cell here...
    
}

// this method will ask for supplementary views - headers and footers - for each section
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionViewLocal viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionViewLocal dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HEADER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        reusableView = [collectionViewLocal dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:FOOTER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    }
    
    return reusableView;

}

//#pragma mark - CHTCollectionViewDelegateWaterfallLayout

// this method asks for the size of cell at indexpath
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    CGSize size;
//    size = [self computeSizeForRowAtIndexPath:indexPath];
    
    return [self.cellSizes[indexPath.item] CGSizeValue];

//    return size;
}

// this method asks for height of footer at indexpath
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section {
    CGFloat height = 120;
    return height;
}

// this method is called when a cell is selected (tapped on)
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell at %ld is selected", (long)[indexPath row]);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
