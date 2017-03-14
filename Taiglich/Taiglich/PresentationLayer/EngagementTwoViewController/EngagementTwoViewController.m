//
//  EngagementTwoViewController.m
//  Taiglich
//
//  Created by Karmick on 14/03/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "EngagementTwoViewController.h"
#import "DefineHeader.h"
#import "Constant.h"

@interface EngagementTwoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    EngagementFirstCell *mEngagementFirstCell;
    EngagementSecondCell *mEngagementSecondCell;
    EngagementThirdCell *mEngagementThirdCell;
    EngagementForthCell *mEngagementForthCell;
    EngagementFifthCell *mEngagementFifthCell;
    EngagementSixthCell *mEngagementSixthCell;
    NSInteger buttonTag;
    BOOL buttonTapped;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tblv_Engagement2;

@end

@implementation EngagementTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tblv_Engagement2.delegate=self;
    _tblv_Engagement2.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
   
 return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{        if (section==2) {
            return 3;
        }
        else{
            return 4;
        }
}
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.0f;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    footerView.backgroundColor = [UIColor clearColor];
    
    return footerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = @"fcbgfvnfgcnc";
    //[self tableView:tableView titleForHeaderInSection:section];
    
    // create and return a custom view
    UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 34.0f)];
    customLabel.text = sectionTitle;
    customLabel.textAlignment=NSTextAlignmentCenter;
    customLabel.textColor=[UIColor colorWithRed:0.0f/255.0f green:135.0f/255.0f blue:184.0f/255.0f alpha:1.0f];
    customLabel.backgroundColor=[UIColor whiteColor];
    return customLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // return a custom height here if necessary
    return 34.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        return 40.0f;
    }
    else{
        return 55.0f;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==2) {
        if (indexPath.row==0){
            mEngagementForthCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementForthCell"];
            [mEngagementForthCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return mEngagementForthCell;
        }
        else if(indexPath.row==1){
            mEngagementFifthCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementFifthCell"];
            [mEngagementFifthCell.btn_Cell_Radio addTarget:self action:@selector(btn_Radio_Click:) forControlEvents:UIControlEventTouchUpInside];
            [mEngagementFifthCell.btn_Cell_Radio1 addTarget:self action:@selector(btn_Radio_Click:) forControlEvents:UIControlEventTouchUpInside];
            [mEngagementFifthCell.btn_Cell_Radio2 addTarget:self action:@selector(btn_Radio_Click:) forControlEvents:UIControlEventTouchUpInside];
            [mEngagementFifthCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return mEngagementFifthCell;
        }
        else{
            mEngagementSixthCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementSixthCell"];
            [mEngagementSixthCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return mEngagementSixthCell;
            
        }
    }
    else{
        
        if (indexPath.row==1){
            mEngagementSecondCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementSecondCell"];
            [mEngagementSecondCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return mEngagementSecondCell;
        }
        else if(indexPath.row==3){
            mEngagementThirdCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementThirdCell"];
            [mEngagementThirdCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return mEngagementThirdCell;
        }
        else{
            mEngagementFirstCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementFirstCell"];
            
            [mEngagementFirstCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
           
            
            return mEngagementFirstCell;
            
        }
    }

}
- (IBAction)btn_Submit_Click:(id)sender {
}
- (IBAction)btn_Home_Click:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"backtohome"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Button Action
-(void)btn_Radio_Click:(id)sender{
    buttonTapped=YES;
    UIButton *button = (UIButton *)sender;
    buttonTag = button.tag;
    DebugLog(@"buttonTag%ld", (long)buttonTag);
}

@end
