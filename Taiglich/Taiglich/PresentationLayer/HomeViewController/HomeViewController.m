//
//  ViewController.m
//  new_project
//
//  Created by SAYAN MAC MINI on 1/23/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "HomeViewController.h"
#import "DefineHeader.h"
#import "Constant.h"
#import "HomeCell.h"
#import "LocationListCollectionViewCell.h"
#import "FormViewController.h"

@interface HomeViewController ()<CustomAction,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    HomeCell *cell;
}
@property(strong,nonatomic)FooterView *mFooterView;
@property (strong, nonatomic) IBOutlet UIView *Footer_view;
@property (strong, nonatomic) IBOutlet UITableView *HomeTableView;
@end

@implementation HomeViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mFooterView =[[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil]  objectAtIndex:0];
    NSLog(@"1-%@",self.view);
    NSLog(@"2--%@",_mFooterView);
    NSLog(@"3----%@",self.Footer_view);
    
    [_mFooterView setFrame:CGRectMake(0,0, self.Footer_view.frame.size.width,60)];
    
    NSLog(@"1-%@",self.view);
    NSLog(@"2--%@",_mFooterView);
    NSLog(@"3---%@",self.Footer_view);
    
    _mFooterView.delegate=self;
    [self.Footer_view addSubview:_mFooterView];
    
    
    self.HomeTableView.delegate=self;
    self.HomeTableView.dataSource=self;
    [self.HomeTableView reloadData];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Delegate For Footer Button

-(void)footerButtonClicked:(int)btnTag{
    if(btnTag==0){
        
        DebugLog(@"Tap0");
    }
    if(btnTag==1){
        
        DebugLog(@"Tap1");
    }
    if(btnTag==2){
        
        DebugLog(@"Tap2");
        FormViewController *objSendMymoveViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"FormViewController"];
        [self addChildViewController:objSendMymoveViewController];
        [self.view addSubview:objSendMymoveViewController.view];
        [objSendMymoveViewController didMoveToParentViewController:self];

    }
    if(btnTag==3){
        //[self aboutus];
        
        
        DebugLog(@"Tap3");
    }
}
#pragma mark - Uicollection DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [collectionView registerNib:[UINib nibWithNibName:@"LocationListCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"LocationListCollectionViewCell"];
    LocationListCollectionViewCell *cellLocationListCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LocationListCollectionViewCell" forIndexPath:indexPath];;
    
    if (cellLocationListCollectionViewCell==nil)
    {
        cellLocationListCollectionViewCell =(LocationListCollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"LocationListCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    }
    //        cell.btn_GalleryImage.tag=indexPath.row;
    //        cell.layer.cornerRadius=15.0;
    //        [cell.btn_GalleryImage addTarget:self action:@selector(btn_GalleryImageAction:) forControlEvents:UIControlEventTouchUpInside];
    //        [cell.btn_GalleryImage setBackgroundImage:[_arrCombinedImage objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    //        cell.backgroundColor=[UIColor clearColor];
    return cellLocationListCollectionViewCell;
    
}

#pragma mark - TableView Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    NSMutableAttributedString *attString =
    [[NSMutableAttributedString alloc]
     initWithString: @"שם פרטי שם פרטי שם פרטי"];
    
    [attString addAttribute: NSFontAttributeName
                      value: [UIFont fontWithName:@"Helvetica" size:15]
                      range: NSMakeRange(0,6)];
    
    
    [attString addAttribute: NSFontAttributeName
                      value:  [UIFont fontWithName:@"Helvetica" size:15]
                      range: NSMakeRange(0,6)];
    
    [attString addAttribute: NSFontAttributeName
                      value:  [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",cell.lbl_1stOne.font.fontName] size:24]
                      range: NSMakeRange(7,4)];
    
    cell.lbl_1stOne.attributedText = attString;
    
    return cell;
}



@end
