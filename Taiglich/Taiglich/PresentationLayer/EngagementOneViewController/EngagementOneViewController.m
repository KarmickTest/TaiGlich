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

@interface EngagementOneViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,PopUpViewControllerDelegate>
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
    
    UIButton *btnYeddish_Week;
    UIButton *btnYeddish_Day;
    UIButton *btnEvent_Location;
    UILabel *lblYeddish_Week;
    UILabel *lblYeddish_Day;
    UILabel *lblEvent_Location;
    
    
    NSMutableArray *arrTitleBackData;
    NSMutableArray *arrTitleFrontData;
    NSMutableArray * arrmYiddishWeek;
    NSMutableArray * arrmOnlyYiddishDay;
    NSString *strBtnPress;
    
    NSMutableArray *arrmLivingTownList;
    NSMutableArray *arrmEventLocationList;
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
    [self getLivingTownData];
    [self getYiddishWeekDayData];
    [self getEventLocationData];

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
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str,@"townName", nil];
    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"הרב",@"townName", nil];
     NSMutableDictionary *dict3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str1,@"townName", nil];
     NSMutableDictionary *dict4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str2,@"townName", nil];
    
    NSMutableDictionary *dict5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str3,@"townName", nil];
    NSMutableDictionary *dict6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str4,@"townName", nil];
    NSMutableDictionary *dict7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str5,@"townName", nil];
    NSMutableDictionary *dict8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str6,@"townName", nil];
    
    arrTitleBackData=[[NSMutableArray alloc]initWithObjects:dict5,dict6,dict7,dict8, nil];
    arrTitleFrontData=[[NSMutableArray alloc]initWithObjects:dict1,dict2,dict3,dict4, nil];
    arrmYiddishWeek=[[NSMutableArray alloc]init];
    arrmOnlyYiddishDay=[[NSMutableArray alloc]init];
    arrmEventLocationList=[[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
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
   
   return 2;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0 ) {
     return 265.0f;
    }
    else{
    return 297.0f;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
       btnYeddish_Week=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:9000];
       btnYeddish_Day=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:9002];
       btnEvent_Location=(UIButton *)[mEngagementSecondCell.contentView viewWithTag:9004];
       lblYeddish_Week=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:9001];
       lblYeddish_Day=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:9003];
       lblEvent_Location=(UILabel *)[mEngagementSecondCell.contentView viewWithTag:9005];
       txtfEntity_Child_First1.delegate=self;
       
       [btnEntity_Title_Back1 addTarget:self action:@selector(btnEntity_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Title_Front1 addTarget:self action:@selector(btnEntity_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Father_Title_Back1 addTarget:self action:@selector(btnEntity_Father_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Father_Title_Front1 addTarget:self action:@selector(btnEntity_Father_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Wife_Father_Title_Back1 addTarget:self action:@selector(btnEntity_Wife_Father_Title_Back_Click1:) forControlEvents:UIControlEventTouchUpInside];
       [btnEntity_Wife_Father_Title_Front1 addTarget:self action:@selector(btnEntity_Wife_Father_Title_Front_Click1:) forControlEvents:UIControlEventTouchUpInside];
        [btnEntity_Living_Town1 addTarget:self action:@selector(btnEntity_Living_Town_Click1:) forControlEvents:UIControlEventTouchUpInside];
        [btnYeddish_Week addTarget:self action:@selector(btnYeddish_Week_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnYeddish_Day addTarget:self action:@selector(btnYeddish_Day_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btnEvent_Location addTarget:self action:@selector(btnEvent_Location_Click:) forControlEvents:UIControlEventTouchUpInside];
       
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
#pragma mark - Custom Delegate

- (void)addItemViewController:(PopUpViewController *)controller didFinishEnteringItem:(NSString *)item dayValue:(NSMutableArray *)arrmDayData locationId:(NSString *)strId{
    DebugLog(@"This was returned PopUpView %@",item);
    DebugLog(@"This was returned PopUPView arrmDayData %@",arrmDayData);
    DebugLog(@"This was returned PopUPView strId %@",strId);
    arrmOnlyYiddishDay=[arrmDayData mutableCopy];
    if ([strBtnPress isEqualToString:@"1"]) {
        lblEntity_Title_Back.text=item;
    }
    else if ([strBtnPress isEqualToString:@"2"]) {
        lblEntity_Father_Title_Back.text=item;
    }
    else if ([strBtnPress isEqualToString:@"3"]) {
        lblEntity_Wife_Father_Title_Back.text=item;
    }
    else if ([strBtnPress isEqualToString:@"4"]){
        lblEntity_Title_Back1.text=item;
    }
    else if ([strBtnPress isEqualToString:@"5"]){
        lblEntity_Father_Title_Back1.text=item;
        
    }
    else if([strBtnPress isEqualToString:@"6"]) {
        lblEntity_Wife_Father_Title_Back1.text=item;
    }
    else if([strBtnPress isEqualToString:@"7"]) {
      lblEntity_Living_Town.text=item;
    }
    else if([strBtnPress isEqualToString:@"8"]) {
        lblEntity_Living_Town1.text=item;
    }
    else if ([strBtnPress isEqualToString:@"11"]) {
        lblEntity_Title_Front.text=item;
    }
    else if ([strBtnPress isEqualToString:@"21"]){
        lblEntity_Father_Title_Front.text=item;
    }
    else if ([strBtnPress isEqualToString:@"31"]) {
        lblEntity_Wife_Father_Title_Front.text=item;
    }
    else if ([strBtnPress isEqualToString:@"41"]){
        lblEntity_Title_Front1.text=item;
    }
    else if ([strBtnPress isEqualToString:@"51"]){
        lblEntity_Father_Title_Front1.text=item;
    }
    else if ([strBtnPress isEqualToString:@"10"]){
        lblEvent_Location.text=item;
        lblEvent_Location.textColor=[UIColor blackColor];
    }
    else if ([strBtnPress isEqualToString:@"Yes"]){
        lblYeddish_Week.text=item;
        lblYeddish_Week.textColor=[UIColor blackColor];
        
    }
    else if ([strBtnPress isEqualToString:@"Day"]){
        lblYeddish_Day.text=item;
        lblYeddish_Day.textColor=[UIColor blackColor];
    }
    else if ([strBtnPress isEqualToString:@"EventLocation"]){
        lblEvent_Location.text=item;
        lblEvent_Location.textColor=[UIColor blackColor];
    }
    
    else  {
        lblEntity_Wife_Father_Title_Front1.text=item;
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)PopUpViewControllerDidTapCancelButton:(PopUpViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
    else if ([DataValidation isNullString:lblYeddish_Week.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Yiddish week should not be blank"];
    }
    else if ([DataValidation isNullString:lblYeddish_Day.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Yiddish day should not be blank"];
    }
    else if ([DataValidation isNullString:lblEvent_Location.text]){
        [Utility showAlertWithTitle:ALERT_TITLE message:@"Event location should not be blank"];
    }else{
        [self PostEventData];
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
    
    [self openPopUpViewForTitleFrontBack:@"1" Data:arrTitleBackData];
   
}
-(void)btnEntity_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"11" Data:arrTitleFrontData];
}

-(void)btnEntity_Father_Title_Back_Click:(id)sender{
    [self openPopUpViewForTitleFrontBack:@"2" Data:arrTitleBackData];
}
-(void)btnEntity_Father_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"21" Data:arrTitleFrontData];
   
    
}
-(void)btnEntity_Wife_Father_Title_Back_Click:(id)sender{
   [self openPopUpViewForTitleFrontBack:@"3" Data:arrTitleBackData];
    
}
-(void)btnEntity_Wife_Father_Title_Front_Click:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"31" Data:arrTitleFrontData];
    
}

-(void)btnEntity_Title_Back_Click1:(id)sender{
   [self openPopUpViewForTitleFrontBack:@"4" Data:arrTitleBackData];
}

-(void)btnEntity_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"41" Data:arrTitleFrontData];
}

-(void)btnEntity_Father_Title_Back_Click1:(id)sender{
    [self openPopUpViewForTitleFrontBack:@"5" Data:arrTitleBackData];
}
-(void)btnEntity_Father_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"51" Data:arrTitleFrontData];
    
    
}
-(void)btnEntity_Wife_Father_Title_Back_Click1:(id)sender{
   [self openPopUpViewForTitleFrontBack:@"6" Data:arrTitleBackData];
    
}
-(void)btnEntity_Wife_Father_Title_Front_Click1:(id)sender{
    NSLog(@"Tap");
    [self openPopUpViewForTitleFrontBack:@"61" Data:arrTitleFrontData];
    
    
}
-(void)btnEntity_Living_Town_Click:(id)sender{
    if (arrmLivingTownList.count>0) {
    [self openPopUpViewForTitleFrontBack:@"7" Data:arrmLivingTownList];
    }
}

-(void)btnEntity_Living_Town_Click1:(id)sender{
    if (arrmLivingTownList.count>0) {
    [self openPopUpViewForTitleFrontBack:@"8" Data:arrmLivingTownList];
    }
}

-(void)btnYeddish_Week_Click:(id)sender{
    DebugLog(@"arrmYiddishWeek%@",arrmYiddishWeek);
    if (arrmYiddishWeek.count>0) {
    [self openPopUpViewForTitleFrontBack:@"Yes" Data:arrmYiddishWeek];
   }
}

-(void)btnYeddish_Day_Click:(id)sender{
    if (arrmOnlyYiddishDay.count>0) {
    [self openPopUpViewForTitleFrontBack:@"Day" Data:arrmOnlyYiddishDay];
    }
}
-(void)btnEvent_Location_Click:(id)sender{
    //if (arrmEventLocationList.count>0) {
    [self openPopUpViewForTitleFrontBack:@"EventLocation" Data:arrmEventLocationList];
    //}
    
}
#pragma mark - Call Web Service
-(void)PostEventData{
    if ([Utility isNetworkAvailable]==YES) {
        NSString *strCreateEventApi=[NSString stringWithFormat:@"%@%@",API,CREATEEVENT];
        DebugLog(@"strCreateEventApi:%@",strCreateEventApi);
        NSString *strPostParameter=[NSString stringWithFormat:@"event_place_name_added=%@&entity_father_title_back=%@&entity_father_name=%@&entity_father_title=%@&entity_child_fast=%@&entity_back=%@&entity_last_name=%@&entity_first_name=%@&entity_title=%@&event_place_zip=%@&event_place_state=%@&event_place_town=%@&event_place_address=%@&event_place_name=%@&location=%@&event_type=%@&yiddish_week=%@&yiddish_day=%@&contact_no=%@&phone_no=%@&entity_wifes_father_title_front=%@&entity_wifes_father_first_name=%@&entity_wifes_father_last_name=%@&entity_wifes_father_title_back=%@&entiy_living_town=%@&bride_father_title_front=%@&bride_father_first_name=%@&bride_father_last_name=%@&bride_father_title_back=%@&bride_first=%@&bride_fathers_father_title_front=%@&bride_fathers_father_first_name=%@&bride_fathers_father_title_back=%@ &bride_mothers_father_title_front=%@&bride_mothers_father_first_name=%@&bride_mothers_father_last_name=%@&bride_mothers_father_title_back=%@&bride_father_living_town=%@",@"",lblEntity_Father_Title_Back.text,txtfEntity_Father_First_Name.text,lblEntity_Title_Front.text,txtfEntity_Child_First.text,lblEntity_Title_Back.text,txtfEntity_Last_Name.text,txtfEntity_First_Name.text,lblEntity_Title_Front.text,@"",@"",@"",@"",@"",lblEvent_Location.text,@"",lblYeddish_Week.text,lblYeddish_Day.text,_txtf_Phone_Number.text,_txtf_Phone_Number.text,lblEntity_Wife_Father_Title_Front.text,txtfEntity_Wife_Father_First_Name.text,txtfEntity_Wife_Father_Last_Name.text,lblEntity_Wife_Father_Title_Back.text,lblEntity_Living_Town.text,lblEntity_Title_Front1.text,txtfEntity_First_Name1.text,txtfEntity_Last_Name1.text,lblEntity_Title_Back1.text,txtfEntity_Child_First1.text,lblEntity_Father_Title_Front1.text,txtfEntity_Father_First_Name1.text,lblEntity_Father_Title_Back1.text,lblEntity_Wife_Father_Title_Front1.text,txtfEntity_Wife_Father_First_Name1.text,txtfEntity_Wife_Father_Last_Name1.text,lblEntity_Wife_Father_Title_Back1.text,lblEntity_Living_Town1.text];
        DebugLog(@"strPostParameter:%@",strPostParameter);
        [[Singelton getInstance] jsonParseWithPostMethod:^(NSDictionary* testResult){
            DebugLog(@"testResult1====%@",testResult);

            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                
            }
            else{
                alert=[[SCLAlertView alloc]init];
                [alert showWarning:self title:@"Warning" subTitle:[testResult valueForKey:@"message"] closeButtonTitle:@"OK" duration:0.0f];
            }
        }andString:strCreateEventApi andParam:strPostParameter];
    }
    else{
        alert=[[SCLAlertView alloc]init];
        [alert showWarning:self title:@"Warning" subTitle:@"Network error" closeButtonTitle:@"OK" duration:0.0f];
    }
    
}
-(void)getYiddishWeekDayData{
    if ([Utility isNetworkAvailable]==YES) {
        NSString *strLocationListingApi=[NSString stringWithFormat:@"%@%@",API,YIDDISKWEEK];
        DebugLog(@"strLocationListingApi:%@",strLocationListingApi);
        [[Singelton getInstance]jsonparse:^(NSDictionary* testResult){
            DebugLog(@"testResult====%@",testResult);
            
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                arrmYiddishWeek=[[testResult valueForKey:@"details"] mutableCopy];
                
                DebugLog(@"arrmYiddishWeek====%@",arrmYiddishWeek);
                
                
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
-(void)getLivingTownData{
    if ([Utility isNetworkAvailable]==YES) {
        NSString *strLocationListingApi=[NSString stringWithFormat:@"%@%@",API,TOWNLISTING];
        DebugLog(@"strLocationListingApi:%@",strLocationListingApi);
        [[Singelton getInstance]jsonparse:^(NSDictionary* testResult){
            DebugLog(@"testResult====%@",testResult);
            
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                arrmLivingTownList=[[testResult valueForKey:@"details"] mutableCopy];
               
                DebugLog(@"arrmLivingTownList====%@",arrmLivingTownList);
                
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
-(void)getEventLocationData{
    if ([Utility isNetworkAvailable]==YES) {
        NSString *strLocationListingApi=[NSString stringWithFormat:@"%@%@",API,LOCATIONLISTING];
        DebugLog(@"strLocationListingApi:%@",strLocationListingApi);
        [[Singelton getInstance]jsonparse:^(NSDictionary* testResult){
            DebugLog(@"testResult====%@",testResult);
            
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                arrmEventLocationList=[[testResult valueForKey:@"details"] mutableCopy];
                
                DebugLog(@"arrmEventLocationList====%@",arrmEventLocationList);
                
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
-(void)openPopUpViewForTitleFrontBack:(NSString *)str Data:(NSMutableArray *)arrmData{
    strBtnPress=str;
    PopUpViewController *mPopUpViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    mPopUpViewController.delegate=self;
    mPopUpViewController.arrmTitleFrontAndBackData=arrmData;
     mPopUpViewController.strComingFromYiddish=strBtnPress;
    DebugLog(@"arrmTitleFrontAndBackData%@", mPopUpViewController.arrmTitleFrontAndBackData);
    mPopUpViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:mPopUpViewController animated:YES completion:NULL];

}

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
