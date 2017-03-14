//
//  EngagementOneViewController.m
//  Taiglich
//
//  Created by Karmick on 08/03/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "EngagementOneViewController.h"
#import "DefineHeader.h"
#import "Constant.h"

@interface EngagementOneViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    SCLAlertView *alert;
    EngagementFirstCell *mEngagementFirstCell;
    EngagementSecondCell *mEngagementSecondCell;
//    EngagementThirdCell *mEngagementThirdCell;
//    EngagementForthCell *mEngagementForthCell;
//    EngagementFifthCell *mEngagementFifthCell;
//    EngagementSixthCell *mEngagementSixthCell;
    
    NSInteger buttonTag;
    
    UILabel * lblEntity_Title_Back;
    UIButton * btnEntity_Title_Back;
    UITextField * txtfEntity_Last_Name;
    UITextField * txtfEntity_First_Name;
    UILabel * lblEntity_Title_Front;
    UIButton * btnEntity_Title_Front;
    
    UILabel * lblEntity_Father_Title_Back;
    UIButton * btnEntity_Father_Title_Back;
    UITextField * txtfEntity_Father_First_Name;
    UILabel * lblEntity_Father_Title_Front;
    UIButton * btnEntity_Father_Title_Front;
    
    UILabel * lblEntity_Wife_Father_Title_Back;
    UIButton * btnEntity_Wife_Father_Title_Back;
    UITextField * txtfEntity_Wife_Father_Last_Name;
    UITextField * txtfEntity_Wife_Father_First_Name;
    UILabel * lblEntity_Wife_Father_Title_Front;
    UIButton * btnEntity_Wife_Father_Title_Front;
    
    UILabel * lblEntity_Child_First;
    UIButton * btnEntity_Child_First;
    UILabel * lblEntity_Living_Town;
    UIButton * btnEntity_Living_Town;
    UITextField *txtfEntity_Child_First;
    
    UILabel * lblEntity_Title_Back1;
    UIButton * btnEntity_Title_Back1;
    UITextField * txtfEntity_Last_Name1;
    UITextField * txtfEntity_First_Name1;
    UILabel * lblEntity_Title_Front1;
    UIButton * btnEntity_Title_Front1;
    
    UILabel * lblEntity_Father_Title_Back1;
    UIButton * btnEntity_Father_Title_Back1;
    UITextField * txtfEntity_Father_First_Name1;
    UILabel * lblEntity_Father_Title_Front1;
    UIButton * btnEntity_Father_Title_Front1;
    
    UILabel * lblEntity_Wife_Father_Title_Back1;
    UIButton * btnEntity_Wife_Father_Title_Back1;
    UITextField * txtfEntity_Wife_Father_Last_Name1;
    UITextField * txtfEntity_Wife_Father_First_Name1;
    UILabel * lblEntity_Wife_Father_Title_Front1;
    UIButton * btnEntity_Wife_Father_Title_Front1;
    
    UILabel * lblEntity_Child_First1;
    UIButton * btnEntity_Child_First1;
    UILabel * lblEntity_Living_Town1;
    UIButton * btnEntity_Living_Town1;
    UITextField *txtfEntity_Child_First1;
    
    UITableView *tblv_Title_Choose;
    NSArray *arrTitleBackData;
    NSArray *arrTitleFrontData;
    NSMutableArray * arrmTitleBackFrontData;
    BOOL tapOnTitleBack;
    NSString *strBtnPress;
    
    NSMutableArray *arrmLivingTownList;
}
@property (weak, nonatomic) IBOutlet UITextField *txtf_Phone_Number;
@property (weak, nonatomic) IBOutlet UITableView *tblv_Engagement1;

@end

#pragma mark - View Life Cycle

@implementation EngagementOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblv_Engagement1.delegate=self;
    _tblv_Engagement1.dataSource=self;
    arrmLivingTownList=[[NSMutableArray alloc]init];
        //
    NSString *str=[NSString stringWithFormat:@"מו\"ה"];
    DebugLog(@"%@",str);
    NSString *str1=[NSString stringWithFormat:@"הרה\"צ"];
    NSString *str2=[NSString stringWithFormat:@"הרה\"ג"];
    
    NSString *str3=[NSString stringWithFormat:@"נ\"י"];
    DebugLog(@"%@",str);
    NSString *str4=[NSString stringWithFormat:@"שליט\"א"];
    NSString *str5=[NSString stringWithFormat:@"ע\"ה"];
    NSString *str6=[NSString stringWithFormat:@"זצ\"ל"];
    _txtf_Phone_Number.delegate=self;
    
    arrTitleBackData=[[NSArray alloc]initWithObjects:str3,str4,str5,str6, nil];
    arrTitleFrontData=[[NSArray alloc]initWithObjects:str,@"הרב",str1,str2, nil];
    arrmTitleBackFrontData=[[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self getLivingTownData];
    
}



#pragma mark - TextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
     [self moveDownViewFrameInClick:self.view];
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField==txtfEntity_Child_First1) {
        [self moveUpViewFrameInClick:self.view];
       
    }
    else if (textField==txtfEntity_Child_First) {
        [self moveUpViewFrameInClick:self.view];
        
    }
    else if (textField==_txtf_Phone_Number){
       [self moveUpViewFrameInClick:self.view]; 
    }
    
    
}


#pragma mark - TableView Delegate and Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
   return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==20001) {
        return [arrTitleBackData count];
    }
    else if (tableView.tag==20002){
       return [arrTitleFrontData count];
    }
    else if (tableView.tag==20003){
        return [arrmLivingTownList count];
    }
    else{
   return 2;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==20001 || tableView.tag==20002 || tableView.tag==20003 ) {
        return 28.0f;
    }
    else{
    return 265.0f;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==20001) {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.font=[UIFont systemFontOfSize:11];
        cell.textLabel.text=[arrTitleBackData objectAtIndex:indexPath.row];
//        UIView *vwSeperator=[[UIView alloc]initWithFrame:CGRectMake(0, 30, cell.frame.size.width, 1.0f)];
//        vwSeperator.backgroundColor=[UIColor lightGrayColor];
//        [cell addSubview:vwSeperator];
        return cell;

    }
    else if (tableView.tag==20002) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.font=[UIFont systemFontOfSize:11];
        cell.textLabel.text=[arrTitleFrontData objectAtIndex:indexPath.row];
//        UIView *vwSeperator=[[UIView alloc]initWithFrame:CGRectMake(0, 30, cell.frame.size.width, 1.0f)];
//        vwSeperator.backgroundColor=[UIColor lightGrayColor];
//        [cell addSubview:vwSeperator];
        return cell;
        
    }
    else if (tableView.tag==20003) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.font=[UIFont systemFontOfSize:11];
        cell.textLabel.text=[[arrmLivingTownList objectAtIndex:indexPath.row] valueForKey:@"townName"];
        //        UIView *vwSeperator=[[UIView alloc]initWithFrame:CGRectMake(0, 30, cell.frame.size.width, 1.0f)];
        //        vwSeperator.backgroundColor=[UIColor lightGrayColor];
        //        [cell addSubview:vwSeperator];
        return cell;
        
    }
    if (indexPath.row==0){
        mEngagementFirstCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementFirstCell"];
        lblEntity_Title_Back=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:1000];
        btnEntity_Title_Back=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:1001];
        txtfEntity_Last_Name=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:1002];
        txtfEntity_Last_Name.delegate=self;
         txtfEntity_First_Name=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:1003];
        txtfEntity_First_Name.delegate=self;
        lblEntity_Title_Front=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:1004];
        btnEntity_Title_Front=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:1005];
        
        lblEntity_Father_Title_Back=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:2000];
        btnEntity_Father_Title_Back=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:2001];
        txtfEntity_Father_First_Name=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:2002];
        txtfEntity_Father_First_Name.delegate=self;
        lblEntity_Father_Title_Front=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:2003];
        btnEntity_Father_Title_Front=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:2004];
        
        lblEntity_Wife_Father_Title_Back=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:3000];
        btnEntity_Wife_Father_Title_Back=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:3001];
        txtfEntity_Wife_Father_Last_Name=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:3002];
        txtfEntity_Wife_Father_Last_Name.delegate=self;
        txtfEntity_Wife_Father_First_Name=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:3003];
        txtfEntity_Wife_Father_First_Name.delegate=self;
        lblEntity_Wife_Father_Title_Front=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:3004];
        btnEntity_Wife_Father_Title_Front=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:3005];
        
        lblEntity_Child_First=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:4000];
        btnEntity_Child_First=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:4001];
        lblEntity_Living_Town=(UILabel *)[mEngagementFirstCell.contentView viewWithTag:4002];
         btnEntity_Living_Town=(UIButton *)[mEngagementFirstCell.contentView viewWithTag:4003];
         txtfEntity_Child_First=(UITextField *)[mEngagementFirstCell.contentView viewWithTag:4004];
        txtfEntity_Child_First.delegate=self;
        [btnEntity_Title_Back addTarget:self action:@selector(btnEntity_Title_Back_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Title_Front addTarget:self action:@selector(btnEntity_Title_Front_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Father_Title_Back addTarget:self action:@selector(btnEntity_Father_Title_Back_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Father_Title_Front addTarget:self action:@selector(btnEntity_Father_Title_Front_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Wife_Father_Title_Back addTarget:self action:@selector(btnEntity_Wife_Father_Title_Back_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Wife_Father_Title_Front addTarget:self action:@selector(btnEntity_Wife_Father_Title_Front_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Living_Town addTarget:self action:@selector(btnEntity_Living_Town_Click:) forControlEvents:UIControlEventTouchUpInside];
        lblEntity_Title_Back.text=@"נ\"י";
        lblEntity_Title_Front.text=@"מו\"ה";
        lblEntity_Father_Title_Back.text=@"נ\"י";
        lblEntity_Father_Title_Front.text=@"מו\"ה";
        lblEntity_Wife_Father_Title_Back.text=@"נ\"י";
        lblEntity_Wife_Father_Title_Front.text=@"מו\"ה";
        
        [mEngagementFirstCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return mEngagementFirstCell;
        
        }
   else{
       mEngagementSecondCell=[tableView dequeueReusableCellWithIdentifier:@"EngagementSecondCell"];
       lblEntity_Title_Back1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:5000];
       btnEntity_Title_Back1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:5001];
       txtfEntity_Last_Name1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:5002];
       txtfEntity_Last_Name1.delegate=self;
       txtfEntity_First_Name1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:5003];
       txtfEntity_First_Name1.delegate=self;
       lblEntity_Title_Front1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:5004];
       btnEntity_Title_Front1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:5005];
       
       lblEntity_Father_Title_Back1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:6000];
       btnEntity_Father_Title_Back1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:6001];
       txtfEntity_Father_First_Name1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:6002];
       txtfEntity_Father_First_Name1.delegate=self;
       lblEntity_Father_Title_Front1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:6003];
       btnEntity_Father_Title_Front1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:6004];
       
       lblEntity_Wife_Father_Title_Back1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:7000];
       btnEntity_Wife_Father_Title_Back1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:7001];
       txtfEntity_Wife_Father_Last_Name1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:7002];
       txtfEntity_Wife_Father_Last_Name1.delegate=self;
       txtfEntity_Wife_Father_First_Name1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:7003];
       txtfEntity_Wife_Father_First_Name1.delegate=self;
       lblEntity_Wife_Father_Title_Front1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:7004];
       btnEntity_Wife_Father_Title_Front1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:7005];
       
       lblEntity_Child_First1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:8000];
       btnEntity_Child_First1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:8001];
       lblEntity_Living_Town1=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:8002];
       btnEntity_Living_Town1=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:8003];
       txtfEntity_Child_First1=(UITextField *)[mEngagementSecondCell.contentView viewWithTag:8004];
       txtfEntity_Child_First1.delegate=self;
       
       [btnEntity_Title_Back1 addTarget:self action:@selector(btnEntity_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Title_Front1 addTarget:self action:@selector(btnEntity_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Father_Title_Back1 addTarget:self action:@selector(btnEntity_Father_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Father_Title_Front1 addTarget:self action:@selector(btnEntity_Father_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Wife_Father_Title_Back1 addTarget:self action:@selector(btnEntity_Wife_Father_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Wife_Father_Title_Front1 addTarget:self action:@selector(btnEntity_Wife_Father_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Living_Town1 addTarget:self action:@selector(btnEntity_Living_Town_Click1:) forControlEvents:UIControlEventTouchUpInside];
       
       lblEntity_Title_Back1.text=@"נ\"י";
       lblEntity_Title_Front1.text=@"מו\"ה";
       lblEntity_Father_Title_Back1.text=@"נ\"י";
       lblEntity_Father_Title_Front1.text=@"מו\"ה";
       lblEntity_Wife_Father_Title_Back1.text=@"נ\"י";
       lblEntity_Wife_Father_Title_Front1.text=@"מו\"ה";
      
       
       
       [mEngagementSecondCell setSelectionStyle:UITableViewCellSelectionStyleNone];
       return mEngagementSecondCell;
       
   }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==20001) {
        if (tblv_Title_Choose) {
            [tblv_Title_Choose removeFromSuperview];
            tblv_Title_Choose = nil;
        }
        if ([strBtnPress isEqualToString:@"1"]) {
        lblEntity_Title_Back.text=[arrTitleBackData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"2"]) {
        lblEntity_Father_Title_Back.text=[arrTitleBackData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"3"]) {
        lblEntity_Wife_Father_Title_Back.text=[arrTitleBackData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"4"]){
        lblEntity_Title_Back1.text=[arrTitleBackData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"5"]){
        lblEntity_Father_Title_Back1.text=[arrTitleBackData objectAtIndex:indexPath.row];

        }
        else {
        lblEntity_Wife_Father_Title_Back1.text=[arrTitleBackData objectAtIndex:indexPath.row];
        }
        _tblv_Engagement1.scrollEnabled=YES;
        }
    else  if (tableView.tag==20002) {
        if (tblv_Title_Choose) {
            [tblv_Title_Choose removeFromSuperview];
            tblv_Title_Choose = nil;
        }
        if ([strBtnPress isEqualToString:@"1"]) {
        lblEntity_Title_Front.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"2"]){
        lblEntity_Father_Title_Front.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"3"]) {
        lblEntity_Wife_Father_Title_Front.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"4"]){
        lblEntity_Title_Front1.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }
        else if ([strBtnPress isEqualToString:@"5"]){
        lblEntity_Father_Title_Front1.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }
        else  {
        lblEntity_Wife_Father_Title_Front1.text=[arrTitleFrontData objectAtIndex:indexPath.row];
        }

        _tblv_Engagement1.scrollEnabled=YES;
        
    }
    else  if (tableView.tag==20003) {
        if (tblv_Title_Choose) {
            [tblv_Title_Choose removeFromSuperview];
            tblv_Title_Choose = nil;
        }
        if ([strBtnPress isEqualToString:@"7"]) {
            lblEntity_Living_Town.text=[[arrmLivingTownList objectAtIndex:indexPath.row] valueForKey:@"townName"];
        }
        else  {
        lblEntity_Living_Town1.text=[[arrmLivingTownList objectAtIndex:indexPath.row] valueForKey:@"townName"];
        }
        
        _tblv_Engagement1.scrollEnabled=YES;
        
    }
    
}
#pragma mark - Button Action

- (IBAction)btn_Submit_Click:(id)sender {
    if([DataValidation isNullString:txtfEntity_First_Name.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Entity first name should not be blank"];
        [txtfEntity_First_Name becomeFirstResponder];
    }
    else if ([DataValidation isNullString:txtfEntity_Last_Name.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Entity last name should not be blank"];
        [txtfEntity_Last_Name becomeFirstResponder];
    }
    else if ([DataValidation isNullString:txtfEntity_Child_First.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Entity child first should not be blank"];
        [txtfEntity_Child_First becomeFirstResponder];
        [self moveUpViewFrameInClick:self.view];
    }
    else if ([DataValidation isNullString:lblEntity_Living_Town.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Entity living town should not be blank"];
        
    }
    else if([DataValidation isNullString:txtfEntity_First_Name1.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Bride father first name should not be blank"];
        [txtfEntity_First_Name1 becomeFirstResponder];
    }
    else if ([DataValidation isNullString:txtfEntity_Last_Name1.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Bride father last name should not be blank"];
        [txtfEntity_Last_Name1 becomeFirstResponder];
    }
    else if ([DataValidation isNullString:txtfEntity_Child_First1.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Bride first should not be blank"];
        [txtfEntity_Child_First1 becomeFirstResponder];
    }
    else if ([DataValidation isNullString:lblEntity_Living_Town1.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Bride father living town should not be blank"];
    }
    else if ([DataValidation isNullString:_txtf_Phone_Number.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Phone number should not be blank"];
    }
    else{
        DebugLog(@"Call web service");
    }
  [self moveDownViewFrameInClick:self.view];
    
}
- (IBAction)btn_Home_Click:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"backtohome"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)btn_Radio_Click:(id)sender{
    UIButton *button = (UIButton *)sender;
    buttonTag = button.tag;
    DebugLog(@"buttonTag%ld", (long)buttonTag);
}
-(void)btnEntity_Title_Back_Click:(id)sender{
    tapOnTitleBack=YES;
    strBtnPress=@"1";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
//    if (arrmTitleBackFrontData.count<=0) {
//        [arrmTitleBackFrontData removeAllObjects];
//    }
//    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
//    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
   
     CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+56+btnEntity_Title_Back.frame.size.height+2, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;

    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
     tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
}
-(void)btnEntity_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
     strBtnPress=@"1";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
//    if (arrmTitleBackFrontData.count<=0) {
//        [arrmTitleBackFrontData removeAllObjects];
//    }
//    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
//    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);

   
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+56+btnEntity_Title_Back.frame.size.height+2, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}

-(void)btnEntity_Father_Title_Back_Click:(id)sender{
    tapOnTitleBack=YES;
     strBtnPress=@"2";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Father_Title_Back.frame.origin.y+108+btnEntity_Father_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Father_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
     strBtnPress=@"2";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+108+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Wife_Father_Title_Back_Click:(id)sender{
    tapOnTitleBack=YES;
    strBtnPress=@"3";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Father_Title_Back.frame.origin.y+161+btnEntity_Father_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Wife_Father_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
    strBtnPress=@"3";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+161+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}

-(void)btnEntity_Title_Back_Click1:(id)sender{
    tapOnTitleBack=YES;
    strBtnPress=@"4";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    
    CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+56+btnEntity_Title_Back.frame.size.height+2, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
     tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
}
-(void)btnEntity_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    strBtnPress=@"4";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+56+btnEntity_Title_Back.frame.size.height+2, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}

-(void)btnEntity_Father_Title_Back_Click1:(id)sender{
    tapOnTitleBack=YES;
    strBtnPress=@"5";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Father_Title_Back.frame.origin.y+108+btnEntity_Father_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Father_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    strBtnPress=@"5";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+108+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Wife_Father_Title_Back_Click1:(id)sender{
    tapOnTitleBack=YES;
    strBtnPress=@"6";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleBackData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(1, _tblv_Engagement1.frame.origin.y+btnEntity_Father_Title_Back.frame.origin.y+161+btnEntity_Father_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20001;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Wife_Father_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    strBtnPress=@"6";
    tapOnTitleBack=NO;
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+161+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20002;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
    
}
-(void)btnEntity_Living_Town_Click:(id)sender{
    strBtnPress=@"7";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width-30, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+214+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20003;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
}

-(void)btnEntity_Living_Town_Click1:(id)sender{
    strBtnPress=@"8";
    if (tblv_Title_Choose) {
        [tblv_Title_Choose removeFromSuperview];
        tblv_Title_Choose = nil;
    }
    //    if (arrmTitleBackFrontData.count<=0) {
    //        [arrmTitleBackFrontData removeAllObjects];
    //    }
    //    arrmTitleBackFrontData=[arrTitleFrontData mutableCopy];
    //    DebugLog(@"arrmTitleBackFrontData %@",arrmTitleBackFrontData);
    CGRect fr = CGRectMake(mEngagementFirstCell.vw_FortitleFront.frame.origin.x+txtfEntity_First_Name.frame.size.width-30, _tblv_Engagement1.frame.origin.y+btnEntity_Title_Back.frame.origin.y+214+btnEntity_Title_Back.frame.size.height+3, 82, 116);
    _tblv_Engagement1.scrollEnabled=NO;
    
    tblv_Title_Choose = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    DebugLog(@"My view frame %@",NSStringFromCGRect(tblv_Title_Choose.frame));
    tblv_Title_Choose.autoresizingMask =UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tblv_Title_Choose.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the previous 'None' style...
    tblv_Title_Choose.separatorColor = [UIColor grayColor];
    tblv_Title_Choose.delegate = self;
    tblv_Title_Choose.dataSource = self;
    tblv_Title_Choose.tag=20003;
    [self.view addSubview:tblv_Title_Choose];
    [tblv_Title_Choose reloadData];
}
#pragma mark - Call Web Service

-(void)getLivingTownData{
    if ([Utility isNetworkAvailable]==YES) {
        NSString *strLocationListingApi=[NSString stringWithFormat:@"%@%@",API,TOWNLISTING];
        DebugLog(@"strLocationListingApi:%@",strLocationListingApi);
        [[Singelton getInstance]jsonparse:^(NSDictionary* testResult){
            DebugLog(@"testResult====%@",testResult);
            
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                arrmLivingTownList=[[testResult valueForKey:@"details"] mutableCopy];
               
                DebugLog(@"arrmLivingTownList====%@",arrmLivingTownList);
                if (arrmLivingTownList.count>0) {
                    
                    [tblv_Title_Choose reloadData];
                }
                else{
                    tblv_Title_Choose.hidden=YES;
                }
                
            }
        else{
            alert=[[SCLAlertView alloc]init];
            [alert showWarning:self title:@"Warning" subTitle:[testResult valueForKey:@"message"] closeButtonTitle:@"OK" duration:0.0f];
        }
        }andString:strLocationListingApi];
    }
    else{
        alert=[[SCLAlertView alloc]init];
        [alert showWarning:self title:@"Warning" subTitle:@"Network error" closeButtonTitle:@"OK" duration:0.0f];
    }

}

#pragma mark - Self Methods

-(void)moveUpViewFrameInClick:(UIView *)viewUp{
    CGRect viewFrame = viewUp.frame;
    if (viewFrame.origin.y>=0 )
    {
        viewFrame.origin.y -= 182;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.5];
        [viewUp setFrame:viewFrame];
        [UIView commitAnimations];
    }
}

-(void)moveDownViewFrameInClick:(UIView *)viewDown{
    CGRect viewFrame = viewDown.frame;
    if (viewFrame.origin.y<0)
    {
        viewFrame.origin.y += 182;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.2];
        [viewDown setFrame:viewFrame];
        [UIView commitAnimations];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
