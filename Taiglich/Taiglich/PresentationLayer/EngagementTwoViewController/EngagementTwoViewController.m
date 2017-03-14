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

@interface EngagementTwoViewController ()<UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>
{
    EngagementFirstCell *mEngagementFirstCell;
    EngagementSecondCell *mEngagementSecondCell;
    EngagementThirdCell *mEngagementThirdCell;
    EngagementForthCell *mEngagementForthCell;
    EngagementFifthCell *mEngagementFifthCell;
    EngagementSixthCell *mEngagementSixthCell;
    NSInteger buttonTag;
    BOOL buttonTapped;
    
    NSMutableArray *engagementListArr;
    
    CGFloat keyboardHeight;
    BOOL keyboardReturned;
}
@property (weak, nonatomic) IBOutlet UITableView *engagementTableView;

@end

@implementation EngagementTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.engagementTableView.delegate=self;
    self.engagementTableView.dataSource=self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    keyboardReturned=NO;
    
    NSMutableDictionary *zeroSectionZeroRow = [[NSMutableDictionary alloc] init];
    [zeroSectionZeroRow setValue:@"" forKey:@"titleBackText"];
    [zeroSectionZeroRow setValue:@"" forKey:@"lastNameText"];
    [zeroSectionZeroRow setValue:@"" forKey:@"firstNameText"];
    [zeroSectionZeroRow setValue:@"" forKey:@"titleFrontText"];
    
    [zeroSectionZeroRow setValue:@"" forKey:@"titleBackPlaceholder"];
    [zeroSectionZeroRow setValue:@"" forKey:@"lastNamePlaceholder"];
    [zeroSectionZeroRow setValue:@"" forKey:@"firstNamePlaceholder"];
    [zeroSectionZeroRow setValue:@"" forKey:@"titleFrontPlaceholder"];
    
    NSMutableDictionary *zeroSectionFirstRow = [[NSMutableDictionary alloc] init];
    [zeroSectionFirstRow setValue:@"" forKey:@"titleBackText"];
    [zeroSectionFirstRow setValue:@"" forKey:@"lastNameText"];
    [zeroSectionFirstRow setValue:@"" forKey:@"firstNameText"];
    [zeroSectionFirstRow setValue:@"" forKey:@"titleFrontText"];
    
    [zeroSectionFirstRow setValue:@"" forKey:@"titleBackPlaceholder"];
    [zeroSectionFirstRow setValue:@"" forKey:@"lastNamePlaceholder"];
    [zeroSectionFirstRow setValue:@"" forKey:@"firstNamePlaceholder"];
    [zeroSectionFirstRow setValue:@"" forKey:@"titleFrontPlaceholder"];
    
    NSMutableDictionary *zeroSectionSecondRow = [[NSMutableDictionary alloc] init];
    [zeroSectionSecondRow setValue:@"" forKey:@"titleBackText"];
    [zeroSectionSecondRow setValue:@"" forKey:@"lastNameText"];
    [zeroSectionSecondRow setValue:@"" forKey:@"firstNameText"];
    [zeroSectionSecondRow setValue:@"" forKey:@"titleFrontText"];
    
    [zeroSectionSecondRow setValue:@"" forKey:@"titleBackPlaceholder"];
    [zeroSectionSecondRow setValue:@"" forKey:@"lastNamePlaceholder"];
    [zeroSectionSecondRow setValue:@"" forKey:@"firstNamePlaceholder"];
    [zeroSectionSecondRow setValue:@"" forKey:@"titleFrontPlaceholder"];
    
    NSMutableDictionary *zeroSectionThirdRow = [[NSMutableDictionary alloc] init];
    [zeroSectionThirdRow setValue:@"" forKey:@"titleBackText"];
    [zeroSectionThirdRow setValue:@"" forKey:@"lastNameText"];
    [zeroSectionThirdRow setValue:@"" forKey:@"firstNameText"];
    [zeroSectionThirdRow setValue:@"" forKey:@"titleFrontText"];
    
    [zeroSectionThirdRow setValue:@"" forKey:@"titleBackPlaceholder"];
    [zeroSectionThirdRow setValue:@"" forKey:@"lastNamePlaceholder"];
    [zeroSectionThirdRow setValue:@"" forKey:@"firstNamePlaceholder"];
    [zeroSectionThirdRow setValue:@"" forKey:@"titleFrontPlaceholder"];
    
    NSMutableArray *sectionArr = [[NSMutableArray alloc] initWithObjects:zeroSectionZeroRow, zeroSectionFirstRow, zeroSectionSecondRow, zeroSectionThirdRow, nil];
    
    NSMutableDictionary *sectionDicZero = [[NSMutableDictionary alloc] init];
    [sectionDicZero setValue:@"Section Zero" forKey:@"sectionName"];
    [sectionDicZero setValue:sectionArr forKey:@"list"];
    
    NSMutableDictionary *sectionDicFirst = [[NSMutableDictionary alloc] init];
    [sectionDicFirst setValue:@"Section One" forKey:@"sectionName"];
    [sectionDicFirst setValue:sectionArr forKey:@"list"];
    
    NSMutableDictionary *sectionDicSecond = [[NSMutableDictionary alloc] init];
    [sectionDicSecond setValue:@"Section Two" forKey:@"sectionName"];
    [sectionDicSecond setValue:sectionArr forKey:@"list"];
    

    engagementListArr = [[NSMutableArray alloc] initWithObjects:sectionDicZero, sectionDicFirst, sectionDicSecond, nil];
    
    NSLog(@"engagementListArr : %@", engagementListArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return engagementListArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
            return 3;
        }
        else{
            return [[[engagementListArr objectAtIndex:section] valueForKey:@"list"] count];
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
    
    UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 30.0f)];
    customLabel.text = [[engagementListArr objectAtIndex:section] valueForKey:@"sectionName"];;
    customLabel.textAlignment=NSTextAlignmentCenter;
    customLabel.textColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    customLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:14];
    customLabel.backgroundColor=[UIColor whiteColor];
    
    return customLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // return a custom height here if necessary
    return 30.0f;
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

- (void)keyboardWillShow:(NSNotification *)notification {
    
    NSLog(@"%f", [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);
    
    keyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    if(keyboardReturned==YES )
    {
        NSLog(@"1st time...");
        
        [self.view layoutIfNeeded];
        self.bottomTrailConstraint.constant = keyboardHeight;
        [self.view layoutIfNeeded];
        keyboardReturned=NO;
    }
    else if (!keyboardReturned==YES )
    {
        NSLog(@"2nd time..");
        
        [self.view layoutIfNeeded];
        self.bottomTrailConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    [self.engagementTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

    keyboardReturned = YES;
}

-(bool)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

@end
