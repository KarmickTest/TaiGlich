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
#import <JTCalendar/JTCalendar.h>

@interface HomeViewController ()<CustomAction,UITableViewDelegate,UITableViewDataSource,JTCalendarDelegate,SWTableViewCellDelegate>
{
    HomeCell *cell;
    LocationTableCell *mLocationTableCell;
    FormViewController *mFormViewController;
    SearchViewController *mSearchViewController;
    InfoViewController *mInfoViewController;
    SettingsViewController *mSettingsViewController;
    LocationListCollectionViewCell *cellLocationListCollectionViewCell;
    BOOL isFirstRowTap;
    NSMutableDictionary *_eventsByDate;
    
    NSDate *_todayDate;
    NSDate *_minDate;
    NSDate *_maxDate;
    
    NSDate *_dateSelected;
    MBProgressHUD *hud;
    SCLAlertView *alert;
    NSString *strDate1;
    NSMutableArray *arrmEventList;
    NSMutableArray *arrmCoppyOfEventList;
    NSMutableArray *arrmLocationList;
    NSMutableArray *arrmSortEventList;
    NSMutableArray *arrmLocationId;
    NSString *strTapOnAll;
    NSDate *appo_date;
    //NSDate *today_Date;
    
    BOOL isSelectAll;
    BOOL isSelectIndividualLocation;
    NSMutableArray *arrmTotalCheckMark;
    NSString *strLocationId1;
    NSDate *currDate;
    NSDateFormatter *dateFormatter1;

}
@property (weak, nonatomic) IBOutlet UILabel *lbl_Day;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Date;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Month;
@property (weak, nonatomic) IBOutlet UIButton *btn_All;
@property (weak, nonatomic) IBOutlet UIView *vw_Location_Mask_view;
@property (weak, nonatomic) IBOutlet UIButton *btn_LoCation;
@property (weak, nonatomic) IBOutlet UIView *vw_For_Location_Table;
@property (weak, nonatomic) IBOutlet UITableView *tblv_Location_Table;
@property (weak, nonatomic) IBOutlet UIView *vw_For_Yesterday;
@property (weak, nonatomic) IBOutlet UIView *vw_For_Tomorrow;
@property (weak, nonatomic) IBOutlet UIView *vw_For_Event_Notification;
@property (weak, nonatomic) IBOutlet UILabel *lbl_For_TaiGlich;

@property (weak, nonatomic) IBOutlet UIView *vw_Yesterday_Tomorrow;
@property (weak, nonatomic) IBOutlet UICollectionView *colv_Location_Cell;
@property(strong,nonatomic)FooterView *mFooterView;
@property (strong, nonatomic) IBOutlet UIView *Footer_view;
@property (strong, nonatomic) IBOutlet UITableView *HomeTableView;

@property (weak, nonatomic) IBOutlet UIView *CalenderBackView;
@property (weak, nonatomic) IBOutlet UIView *vw_Mask_View;


@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTHorizontalCalendarView *calendarContentView;

@property (strong, nonatomic) JTCalendarManager *calendarManager;
@end

@implementation HomeViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _colv_Location_Cell.delegate=self;
//    _colv_Location_Cell.dataSource=self;
//    [_colv_Location_Cell registerNib:[UINib nibWithNibName:@"LocationListCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"LocationListCollectionViewCell"];
//    [_colv_Location_Cell reloadData];
    NSDate *todayDate2 = [NSDate date];
    appo_date=todayDate2;


    _mFooterView =[[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil]  objectAtIndex:0];
    [_mFooterView setFrame:CGRectMake(0,0, self.Footer_view.frame.size.width,43)];
    DebugLog(@"1-%@",self.view);
    DebugLog(@"2--%@",_mFooterView);
    DebugLog(@"3---%@",self.Footer_view);
    _mFooterView.delegate=self;
    [self.Footer_view addSubview:_mFooterView];
    
    
    self.HomeTableView.delegate=self;
    self.HomeTableView.dataSource=self;
    self.HomeTableView.tag=2010;
    self.HomeTableView.showsVerticalScrollIndicator=NO;
    arrmEventList=[[NSMutableArray alloc]init];
    
    
    self.tblv_Location_Table.delegate=self;
    self.tblv_Location_Table.dataSource=self;
    self.tblv_Location_Table.tag=2011;
    self.tblv_Location_Table.showsVerticalScrollIndicator=NO;
    arrmEventList=[[NSMutableArray alloc]init];
    arrmSortEventList=[[NSMutableArray alloc]init];
    arrmCoppyOfEventList=[[NSMutableArray alloc]init];
    arrmLocationId=[[NSMutableArray alloc]init];
    
   // [self.colv_Location_Cell setAllowsMultipleSelection:YES];
   
    
    _CalenderBackView.hidden=YES;
    _vw_Mask_View.hidden=YES;
    _vw_For_Location_Table.hidden=YES;
    _vw_Location_Mask_view.hidden=YES;
    self.CalenderBackView.layer.cornerRadius=5.0f;
    self.CalenderBackView.clipsToBounds=YES;
    
    _calendarManager = [JTCalendarManager new];
    _calendarManager.delegate = self;
    
    // Generate random events sort by date using a dateformatter for the demonstration
    //[self createRandomEvents];
    
    // Create a min and max date for limit the calendar, optional
    [self createMinAndMaxDate];
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:_todayDate];
    
    _vw_For_Tomorrow.layer.borderWidth=1.0f;
    _vw_For_Tomorrow.layer.borderColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor;
    _vw_For_Event_Notification.layer.borderWidth=1.0f;
    _vw_For_Event_Notification.layer.borderColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor;
    _vw_For_Yesterday.layer.borderWidth=1.0f;
    _vw_For_Yesterday.layer.borderColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor;
    _lbl_For_TaiGlich.layer.borderWidth=1.0f;
    _lbl_For_TaiGlich.layer.borderColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor;
    _vw_Yesterday_Tomorrow.layer.borderWidth=1.0f;
    _vw_Yesterday_Tomorrow.layer.borderColor=[UIColor clearColor].CGColor;
    _vw_For_Location_Table.layer.cornerRadius=5.0f;
    
    /*******************************ALL BUTTON SELECTION**********************************************/
    isSelectAll=YES;
    isSelectIndividualLocation=NO;
    
    arrmTotalCheckMark =[[NSMutableArray alloc]init];
    
}
-(void)viewWillAppear:(BOOL)animated{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"backtohome"]) {
        if (mSearchViewController) {
            [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
    }
    
    

    _dateSelected=[NSDate date];
    
     dateFormatter1=[[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"EEEE MMM. d YYYY"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSLog(@"dateFormatter%@",[dateFormatter1 stringFromDate:[NSDate date]]);
    
    NSString *convertedDateString2 = [dateFormatter1 stringFromDate:appo_date];
    NSArray *Date_chunks = [convertedDateString2 componentsSeparatedByString: @" "];
    
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]);
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:0]]);
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:1]]);
    
    dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
    NSString *convertedDateString4 = [dateFormatter1 stringFromDate:appo_date];
    
    [[NSUserDefaults standardUserDefaults]setObject:convertedDateString4 forKey:@"Selected_Date"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //    NSDate *now = [[NSDate alloc] init];
    //    NSString *dateString = [format stringFromDate:[now dateByAddingTimeInterval:(-60*60*24*10)]];
//    NSMutableString *tempDate = [[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]];
//    int day = [[tempDate substringFromIndex:[tempDate length]-1] intValue];
//    switch (day) {
//        case 1:
//        case 21:
//        case 31:
//            [tempDate appendString:@"st"];
//            break;
//        case 2:
//        case 22:
//            [tempDate appendString:@"nd"];
//            break;
//        case 3:
//        case 23:
//            [tempDate appendString:@"rd"];
//            break;
//        default:
//            [tempDate appendString:@"th"];
//            break;
//    }
//    NSLog(@"tempDate%@",tempDate);//
    
//    _lbl_Day.text=[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:0]];
//    _lbl_Date.text=[NSString stringWithFormat:@"%@",tempDate];
    _lbl_Month.text=[NSString stringWithFormat:@"%@ %@, %@",[Date_chunks objectAtIndex:1],[Date_chunks objectAtIndex:2],[Date_chunks objectAtIndex:3]];
    
    [super viewWillAppear:NO];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Background work
         [self getLocationListData];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI
           [self getEventData];
            
        });
    });
    
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Delegate For Footer Button

-(void)footerButtonClicked:(int)btnTag{
    if(btnTag==0){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"backtohome"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if (mSearchViewController) {
            [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
        DebugLog(@"Tap0");
    }
    if(btnTag==1){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"backtohome"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        if (mSearchViewController) {
        [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
        mSearchViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
        mSearchViewController.delegate = self;
        [mSearchViewController.view setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-43)];
        [self.view addSubview:mSearchViewController.view];
        [self addChildViewController:mSearchViewController];
        DebugLog(@"Tap1");
    }
    if(btnTag==2){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"backtohome"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        if (mSearchViewController) {
            [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
        mFormViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FormViewController"];
        mFormViewController.delegate = self;
        [mFormViewController.view setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-43)];
        [self.view addSubview:mFormViewController.view];
        [self addChildViewController:mFormViewController];
       DebugLog(@"Tap2");

    }
    if(btnTag==3){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"backtohome"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        //[self aboutus];
        if (mSearchViewController) {
            [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
        mInfoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
        mInfoViewController.delegate = self;
        [mInfoViewController.view setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-43)];
        [self.view addSubview:mInfoViewController.view];
        [self addChildViewController:mInfoViewController];
        DebugLog(@"Tap3");
    }
    if(btnTag==4){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"backtohome"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        //[self aboutus];
        if (mSearchViewController) {
            [mSearchViewController.view removeFromSuperview];
        }
        if (mFormViewController) {
            [mFormViewController.view removeFromSuperview];
        }
        if (mInfoViewController) {
            [mInfoViewController.view removeFromSuperview];
        }
        if (mSettingsViewController) {
            [mSettingsViewController.view removeFromSuperview];
        }
        mSettingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        mSettingsViewController.delegate = self;
        [mSettingsViewController.view setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-43)];
        [self.view addSubview:mSettingsViewController.view];
        [self addChildViewController:mSettingsViewController];
        DebugLog(@"Tap4");
    }
}

#pragma mark - CalendarManager delegate - Page mangement

- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(JTCalendarDayView *)dayView
{
    // Today
    if([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor colorWithRed:6/255.0f green:147/255.0f blue:194/255.0f alpha:1];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Selected date
    else if(_dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Other month
    else if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor lightGrayColor];
    }
    // Another day of the current month
    else{
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor blackColor];
    }
    
    if([self haveEventForDay:dayView.date]){
        dayView.dotView.hidden = NO;
    }
    else{
        dayView.dotView.hidden = YES;
    }
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(JTCalendarDayView *)dayView{
    _dateSelected = dayView.date;
    DebugLog(@"%@",_dateSelected);
    
    appo_date=dayView.date;
    
     dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"EEEE MMM. d YYYY"];
    NSString *convertedDateString2 = [dateFormatter1 stringFromDate:appo_date];
    NSArray *Date_chunks = [convertedDateString2 componentsSeparatedByString: @" "];
    _lbl_Month.text=[NSString stringWithFormat:@"%@ %@, %@",[Date_chunks objectAtIndex:1],[Date_chunks objectAtIndex:2],[Date_chunks objectAtIndex:3]];


    
    // Animation for the circleView
    dayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView
                      duration:.3
                       options:0
                    animations:^{
                        dayView.circleView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
    
    
    // Don't change page in week mode because block the selection of days in first and last weeks of the month
    if(_calendarManager.settings.weekModeEnabled){
        return;
    }
    
    // Load the previous or next page if touch a day from another month
    
    if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        if([_calendarContentView.date compare:dayView.date] == NSOrderedAscending){
            [_calendarContentView loadNextPageWithAnimation];
        }
        else{
            [_calendarContentView loadPreviousPageWithAnimation];
        }
    }
}

// Used to limit the date for the calendar, optional
- (BOOL)calendar:(JTCalendarManager *)calendar canDisplayPageWithDate:(NSDate *)date
{
    return [_calendarManager.dateHelper date:date isEqualOrAfter:_minDate andEqualOrBefore:_maxDate];
}

- (void)calendarDidLoadNextPage:(JTCalendarManager *)calendar
{
    //    NSLog(@"Next page loaded");
}

- (void)calendarDidLoadPreviousPage:(JTCalendarManager *)calendar
{
    //    NSLog(@"Previous page loaded");
}

#pragma mark - Fake data

- (void)createMinAndMaxDate
{
    _todayDate = [NSDate date];
    
    // Min date will be 2 month before today
    _minDate = [_calendarManager.dateHelper addToDate:_todayDate months:-2];
    
    // Max date will be 2 month after today
    _maxDate = [_calendarManager.dateHelper addToDate:_todayDate months:2];
}

// Used only to have a key for _eventsByDate
- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"MM/dd/yyyy";
    }
    
    return dateFormatter;
}

- (BOOL)haveEventForDay:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(_eventsByDate[key] && [_eventsByDate[key] count] > 0){
        return YES;
    }
    
    return NO;
    
}

- (void)createRandomEvents
{
    _eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i){
        // Generate 30 random dates between now and 60 days later
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        // Use the date as key for eventsByDate
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if(!_eventsByDate[key]){
            _eventsByDate[key] = [NSMutableArray new];
        }
        
        [_eventsByDate[key] addObject:randomDate];
    }
}
#pragma mark - Self Methods

-(void)reloadHomeTableAllData{
    _vw_For_Location_Table.hidden=YES;
    _vw_Location_Mask_view.hidden=YES;
    _btn_LoCation.userInteractionEnabled=YES;
    if (arrmSortEventList.count>0) {
        [arrmSortEventList removeAllObjects];
    }
    NSString *strCompareLocationId1;
    for (int i=0; i<arrmLocationId.count; i++) {
        strCompareLocationId1=[NSString stringWithFormat:@"%@",[arrmLocationId  objectAtIndex:i]];
        DebugLog(@"strCompareLocationId1===%@",strCompareLocationId1);
        for (int j=0; j<arrmEventList.count; j++) {
            NSString *strCompareLocationId2=[NSString stringWithFormat:@"%@",[[arrmEventList  valueForKey:@"location"]objectAtIndex:j]];
            DebugLog(@"strCompareLocationId2===%@",strCompareLocationId2);
            if ([strCompareLocationId1 isEqualToString:strCompareLocationId2]) {
                [arrmSortEventList addObject:[arrmEventList objectAtIndex:j]];
                
            }
        }
    }
    DebugLog(@"arrmSortEventList%@",arrmSortEventList);
    
    if (arrmLocationId.count>0) {
        [arrmEventList removeAllObjects];
        DebugLog(@"arrmEventList%@",arrmEventList);
        arrmEventList=[arrmSortEventList mutableCopy];
        if (arrmEventList.count==0) {
            alert=[[SCLAlertView alloc]init];
            [alert showWarning:self title:@"Warning" subTitle:@"No data found" closeButtonTitle:@"OK" duration:0.0f];
            _HomeTableView.hidden=YES;
        }
        else{
            _HomeTableView.hidden=NO;
        }
    }
    else{
        arrmEventList=[arrmCoppyOfEventList mutableCopy];
    }
    DebugLog(@"arrmEventList%@",arrmEventList);
    if (arrmEventList.count>0) {
        [_HomeTableView reloadData];
    }

}
#pragma mark - Button Action
- (IBAction)btn_Today_Click:(id)sender {
    _dateSelected= [NSDate date];
    [self getEventData];
}

- (IBAction)btn_Previous_Click:(id)sender {
    int daysToAdd = -1;
    appo_date = [appo_date dateByAddingTimeInterval:60*60*24*daysToAdd];
    _dateSelected=appo_date;
     DebugLog(@"%@",[NSString stringWithFormat:@"_dateSelected%@",_dateSelected]);
    [self getEventData];
   
    dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"EEEE MMM. d YYYY"];
    NSString *convertedDateString2 = [dateFormatter1 stringFromDate:appo_date];
    NSArray *Date_chunks = [convertedDateString2 componentsSeparatedByString: @" "];
    
    //[_ selectDate:appo_date makeVisible:YES];
    
    dateFormatter1= [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
    NSString *convertedDateString4 = [dateFormatter1 stringFromDate:appo_date];
    DebugLog(@"convertedDateString4%@",convertedDateString4);
    
    [[NSUserDefaults standardUserDefaults]setObject:convertedDateString4 forKey:@"Selected_Date"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
     DebugLog(@"%@",[NSString stringWithFormat:@"convertedDateString4%@",convertedDateString4]);
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]);
     DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:0]]);
     DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:1]]);
    
//    
//    NSMutableString *tempDate = [[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]];
//    int day = [[tempDate substringFromIndex:[tempDate length]-1] intValue];
//    switch (day) {
//        case 1:
//        case 21:
//        case 31:
//            [tempDate appendString:@"st"];
//            break;
//        case 2:
//        case 22:
//            [tempDate appendString:@"nd"];
//            break;
//        case 3:
//        case 23:
//            [tempDate appendString:@"rd"];
//            break;
//        default:
//            [tempDate appendString:@"th"];
//            break;
//    }
//    DebugLog(@"tempDate%@",tempDate);
    
    
     _lbl_Month.text=[NSString stringWithFormat:@"%@ %@, %@",[Date_chunks objectAtIndex:1],[Date_chunks objectAtIndex:2],[Date_chunks objectAtIndex:3]];
    
    
  
    
}
- (IBAction)btn_Next_Click:(id)sender {
    int daysToAdd = 1;
    appo_date = [appo_date dateByAddingTimeInterval:60*60*24*daysToAdd];
    _dateSelected=appo_date;
    [self getEventData];
     DebugLog(@"%@",[NSString stringWithFormat:@"_dateSelected%@",_dateSelected]);
    dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"EEEE MMM. d YYYY"];
    NSString *convertedDateString2 = [dateFormatter1 stringFromDate:appo_date];
    NSArray *Date_chunks = [convertedDateString2 componentsSeparatedByString: @" "];
    
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]);
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:0]]);
    DebugLog(@"%@",[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:1]]);
    DebugLog(@"%@",[NSString stringWithFormat:@"_dateSelected%@",_dateSelected]);
    
//    dateFormatter1 = [[NSDateFormatter alloc] init];
//    [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
//    NSString *convertedDateString4 = [dateFormatter1 stringFromDate:appo_date];
//    
//    DebugLog(@"convertedDateString5%@",convertedDateString4);
//    
//    [[NSUserDefaults standardUserDefaults]setObject:convertedDateString4 forKey:@"Selected_Date"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    
//    NSDate *now = [[NSDate alloc] init];
//    NSString *dateString = [format stringFromDate:[now dateByAddingTimeInterval:(-60*60*24*10)]];
//    NSMutableString *tempDate = [[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:2]]];
//    int day = [[tempDate substringFromIndex:[tempDate length]-1] intValue];
//    switch (day) {
//        case 1:
//            case 21:
//        case 31:
//            [tempDate appendString:@"st"];
//            break;
//        case 2:
//            case 22:
//            [tempDate appendString:@"nd"];
//            break;
//        case 3:
//            case 23:
//            [tempDate appendString:@"rd"];
//            break;
//        default:
//            [tempDate appendString:@"th"];
//            break;
//    }
//    NSLog(@"tempDate%@",tempDate);
    
//    _lbl_Day.text=[NSString stringWithFormat:@"%@",[Date_chunks objectAtIndex:0]];
//    _lbl_Date.text=[NSString stringWithFormat:@"%@",tempDate];
    _lbl_Month.text=[NSString stringWithFormat:@"%@ %@, %@",[Date_chunks objectAtIndex:1],[Date_chunks objectAtIndex:2],[Date_chunks objectAtIndex:3]];
}

- (IBAction)CalenderNextBtn:(id)sender{
    [_calendarContentView loadNextPageWithAnimation];
    [_calendarManager reload];
    
    NSLog(@"next tap");
    
}


- (IBAction)CalenderPreviousBtn:(id)sender{
    [_calendarContentView loadPreviousPageWithAnimation];
    [_calendarManager reload];
    
    NSLog(@"previous tap");
    
}
- (IBAction)btn_Ok_Click:(id)sender {
    [_calendarManager reload];
     _vw_Mask_View.hidden=YES;
    _CalenderBackView.hidden=YES;
      [self getEventData];
}
- (IBAction)btn_All_Click:(id)sender {
    if (!isSelectAll) {
        for (int i=0; i<[arrmLocationList count]; i++)  {
            [arrmTotalCheckMark addObject:[NSString stringWithFormat:@"%d",i]];
            strLocationId1=[[arrmLocationList objectAtIndex:i] valueForKey:@"location_id"];
            [arrmLocationId addObject:strLocationId1];
        }

        DebugLog(@"arrmTotalCheckMark====%@",arrmTotalCheckMark);
        DebugLog(@"arrmTotalCheckMark====%@",arrmLocationId);
        [self.tblv_Location_Table reloadData];
        
        [_btn_All setTitle:@"DESELECT ALL" forState:UIControlStateNormal];
        //[_btn_All setBackgroundColor:[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
        isSelectAll=YES;
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"select"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }
    else{

        DebugLog(@"arrmTotalCheckMark====%@",arrmTotalCheckMark);
        [arrmTotalCheckMark removeAllObjects];
        [arrmLocationId removeAllObjects];
        [self.tblv_Location_Table reloadData];
        [_btn_All setTitle:@"SELECT ALL" forState:UIControlStateNormal];
       // [_btn_All setBackgroundColor:[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
        isSelectAll=NO;
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"select"];
        [[NSUserDefaults standardUserDefaults]synchronize];

    }
   // [self reloadHomeTableAllData];
}
- (IBAction)btn_Ok_For_Location_Click:(id)sender {
    if (isSelectAll) {
         [self reloadHomeTableAllData];
    }
    else{
        if (arrmLocationId.count>0) {
            [self reloadHomeTableAllData];
        }
        else{
            alert=[[SCLAlertView alloc]init];
            [alert showWarning:self title:@"Warning" subTitle:@"Please select atleast one location" closeButtonTitle:@"OK" duration:0.0f];
        }
    }
   
//    _vw_For_Location_Table.hidden=YES;
//    _vw_Location_Mask_view.hidden=YES;
//    _btn_LoCation.userInteractionEnabled=YES;
//    if (arrmSortEventList.count>0) {
//        [arrmSortEventList removeAllObjects];
//    }
//    NSString *strCompareLocationId1;
//    for (int i=0; i<arrmLocationId.count; i++) {
//       strCompareLocationId1=[NSString stringWithFormat:@"%@",[arrmLocationId  objectAtIndex:i]];
//        DebugLog(@"strCompareLocationId1===%@",strCompareLocationId1);
//    for (int j=0; j<arrmEventList.count; j++) {
//        NSString *strCompareLocationId2=[NSString stringWithFormat:@"%@",[[arrmEventList  valueForKey:@"location"]objectAtIndex:j]];
//         DebugLog(@"strCompareLocationId2===%@",strCompareLocationId2);
//        if ([strCompareLocationId1 isEqualToString:strCompareLocationId2]) {
//            [arrmSortEventList addObject:[arrmEventList objectAtIndex:j]];
//            
//        }
//        }
//    }
//    DebugLog(@"arrmSortEventList%@",arrmSortEventList);
//
//    if (arrmLocationId.count>0) {
//        [arrmEventList removeAllObjects];
//        DebugLog(@"arrmEventList%@",arrmEventList);
//        arrmEventList=[arrmSortEventList mutableCopy];
//        if (arrmEventList.count==0) {
//        alert=[[SCLAlertView alloc]init];
//        [alert showWarning:self title:@"Warning" subTitle:@"No data found" closeButtonTitle:@"OK" duration:0.0f];
//            _HomeTableView.hidden=YES;
//        }
//        else{
//             _HomeTableView.hidden=NO;
//        }
//    }
//    else{
//        arrmEventList=[arrmCoppyOfEventList mutableCopy];
//    }
//    DebugLog(@"arrmEventList%@",arrmEventList);
//    if (arrmEventList.count>0) {
//        [_HomeTableView reloadData];
//    }
    
}

- (IBAction)btn_Cancel_click:(id)sender {
    [_calendarManager reload];
    _vw_Mask_View.hidden=YES;
    _CalenderBackView.hidden=YES;
    
    [UIView transitionWithView:self.CalenderBackView
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:NULL
                    completion:NULL];
    
    [self.CalenderBackView  setHidden:YES];
    
}

- (IBAction)btn_Calender_Click:(id)sender {
    [_calendarManager reload];
    _vw_Mask_View.hidden=NO;
    _vw_For_Location_Table.hidden=YES;
    [UIView beginAnimations:@"LeftFlip" context:nil];
    [UIView setAnimationDuration:0.8];
    _CalenderBackView.hidden=NO;
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown    forView:_CalenderBackView cache:YES];
    [UIView commitAnimations];
   
}
- (IBAction)btn_Location_Click:(id)sender {
    
    _vw_Mask_View.hidden=YES;
    _vw_Location_Mask_view.hidden=NO;
     _vw_For_Location_Table.hidden=NO;
    _btn_LoCation.userInteractionEnabled=NO;
    
    if (isSelectAll) {
        for (int i=0; i<[arrmLocationList count]; i++)  {
            [arrmTotalCheckMark addObject:[NSString stringWithFormat:@"%d",i]];
            strLocationId1=[[arrmLocationList objectAtIndex:i] valueForKey:@"location_id"];
            [arrmLocationId addObject:strLocationId1];
        }
        
        DebugLog(@"arrmTotalCheckMark====%@",arrmTotalCheckMark);
        DebugLog(@"arrmTotalCheckMark====%@",arrmLocationId);
        
        [_btn_All setTitle:@"DESELECT ALL" forState:UIControlStateNormal];
        [_btn_All setBackgroundColor:[UIColor colorWithRed:33.0f/255.0f green:185.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
    
         [_tblv_Location_Table reloadData];
    }
    DebugLog(@"arrmTotalCheckMark====%@",arrmTotalCheckMark);
   

//    if (arrmEventList.count==0) {
//        arrmEventList=[arrmCoppyOfEventList mutableCopy];
//        [_HomeTableView reloadData];
//        _HomeTableView.hidden=NO;
//    }
    DebugLog(@"arrmEventListLocation%@",arrmEventList);
//    if (arrmLocationId.count>0 ) {
//        [arrmLocationId removeAllObjects];
//        [arrmCollctionIndex removeAllObjects];
//        [_tblv_Location_Table reloadData];
//    }
   

   
}

#pragma mark - TableView Delegate and Data source


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==2011) {
        return [arrmLocationList count];
    }
    else{
    return [arrmEventList count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==2011) {
        mLocationTableCell=[tableView dequeueReusableCellWithIdentifier:@"LocationTableCell"];
        mLocationTableCell.lbl_Location_Name.text=[[arrmLocationList objectAtIndex:indexPath.row]valueForKey:@"location"];
        
        
        if ([arrmTotalCheckMark containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]])
        {
            mLocationTableCell.imgv_Checkd_Unchecked.image = [UIImage imageNamed:@"checked"];
        }
        else
        {
            mLocationTableCell.imgv_Checkd_Unchecked.image=[UIImage imageNamed:@"unchecked"];
        }
        
        [mLocationTableCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return mLocationTableCell;
    }
    else{
    cell=[tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    cell.leftUtilityButtons = [self leftButtons];
    cell.delegate = self;
        
        
    UIFont *robotoRegular = [UIFont fontWithName:@"Helvetica" size:12.0];
    NSDictionary *robotoMediumDict = [NSDictionary dictionaryWithObjectsAndKeys:robotoRegular,NSFontAttributeName,[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f],NSForegroundColorAttributeName, nil];
        
   NSDictionary *robotoRegularDict = [NSDictionary dictionaryWithObjectsAndKeys:robotoRegular,NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil];
        
    NSMutableAttributedString *entityChildFast = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entity_child_fast"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
    NSMutableAttributedString *firstName = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",@"First Name"] attributes:robotoMediumDict];
        
    NSMutableAttributedString *middleName = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",@"Middle Name",@" "] attributes:robotoMediumDict];
        
    NSMutableAttributedString *brideFirst = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_first"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
    NSMutableAttributedString *lastName = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",@"Last Name",@" "] attributes:robotoMediumDict];
        
    [entityChildFast appendAttributedString:firstName];
    [middleName  appendAttributedString:entityChildFast];
    [brideFirst appendAttributedString:middleName];
    [lastName appendAttributedString:brideFirst];
   
     cell.lbl_1stOne.attributedText = lastName;
        
      NSMutableAttributedString *entityFirstName1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"First Name"] attributes:robotoMediumDict];
        
       NSMutableAttributedString *entityTitleFront = [[NSMutableAttributedString alloc] initWithString:[NSString  stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entity_title"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        
       NSMutableAttributedString *entityFirstName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entity_first_name"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
       NSMutableAttributedString *entityLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entity_last_name"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
       NSMutableAttributedString *entityTitleBack = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entity_back"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        NSString *strEntityWifesFatherLastName=[NSString stringWithFormat:@"%@",[[arrmEventList valueForKey:@"entity_wifes_father_last_name"]objectAtIndex:indexPath.row]];
        NSMutableAttributedString *entityWifesFatherLastName;
        if (strEntityWifesFatherLastName.length>0) {
        entityWifesFatherLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"[%@]%@",strEntityWifesFatherLastName,@" "] attributes:robotoMediumDict];
        }
        else{
        entityWifesFatherLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@" "] attributes:robotoMediumDict];
        }
      NSMutableAttributedString *entityLivingTown = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"entiy_living_town"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        
        [entityTitleFront appendAttributedString:entityFirstName1];
        [entityFirstName appendAttributedString:entityTitleFront];
        [entityLastName appendAttributedString:entityFirstName];
        [entityTitleBack appendAttributedString:entityLastName];
        [entityWifesFatherLastName appendAttributedString:entityTitleBack];
        [entityLivingTown appendAttributedString:entityWifesFatherLastName];
        
        cell.lbl_Second.attributedText=entityLivingTown;
        
        NSMutableAttributedString *entityFirstName2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"First Name"] attributes:robotoMediumDict];
        
        NSMutableAttributedString *brideFatherTitleFront = [[NSMutableAttributedString alloc] initWithString:[NSString  stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_father_title_front"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        
        NSMutableAttributedString *brideFatherFirstName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_father_first_name"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
        NSMutableAttributedString *brideFatherLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_father_last_name"]objectAtIndex:indexPath.row],@" "] attributes:robotoRegularDict];
        
        NSMutableAttributedString *brideFatherTitleBack = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_father_title_back"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        
        NSString *strBrideMothersFatherLastName=[NSString stringWithFormat:@"%@",[[arrmEventList valueForKey:@"bride_mothers_father_last_name"]objectAtIndex:indexPath.row]];
        
        NSMutableAttributedString * brideMothersFatherLastName;
        if (strBrideMothersFatherLastName.length>0) {
            brideMothersFatherLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"[%@]%@",strBrideMothersFatherLastName,@" "] attributes:robotoMediumDict];
        }
        else{
            brideMothersFatherLastName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@" "] attributes:robotoMediumDict];
        }
        NSMutableAttributedString *bridesFatherLivingTown = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",[[arrmEventList valueForKey:@"bride_father_living_town"]objectAtIndex:indexPath.row],@" "] attributes:robotoMediumDict];
        
        [brideFatherTitleFront appendAttributedString:entityFirstName2];
        
        [brideFatherFirstName appendAttributedString:brideFatherTitleFront];
        
        [brideFatherLastName appendAttributedString:brideFatherFirstName];
        
        [brideFatherTitleBack appendAttributedString:brideFatherLastName];
        
        [brideMothersFatherLastName appendAttributedString:brideFatherTitleBack];
        
        [bridesFatherLivingTown appendAttributedString:brideMothersFatherLastName];
        
        cell.lbl_Third.attributedText=bridesFatherLivingTown;
        cell.lbl_Loction.text=[NSString stringWithFormat:@"%@%@%@%@",[[arrmEventList valueForKey:@"event_place_address"]objectAtIndex:indexPath.row],[[arrmEventList valueForKey:@"event_place_town"]objectAtIndex:indexPath.row],[[arrmEventList valueForKey:@"event_place_state"]objectAtIndex:indexPath.row],[[arrmEventList valueForKey:@"event_place_zip"]objectAtIndex:indexPath.row]];
          
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==2011) {
        DebugLog(@"%ld",(long)indexPath.row);
        
        if ([arrmTotalCheckMark containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]) {
            [arrmTotalCheckMark removeObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
            strLocationId1=[[arrmLocationList objectAtIndex:indexPath.row] valueForKey:@"location_id"];
            [arrmLocationId removeObject:strLocationId1];
        
        }
        else{
            strLocationId1=[[arrmLocationList objectAtIndex:indexPath.row] valueForKey:@"location_id"];
            [arrmLocationId addObject:strLocationId1];
            [arrmTotalCheckMark addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        }
         DebugLog(@"arrmLocationId%@",arrmLocationId);
        
        if (arrmTotalCheckMark.count == arrmLocationList.count)
        {
            [_btn_All setTitle:@"DESELECT ALL" forState:UIControlStateNormal];
            [_btn_All setBackgroundColor:[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
            isSelectAll=YES;
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"select"];
            [[NSUserDefaults standardUserDefaults]synchronize];

        }
        if (arrmTotalCheckMark.count == 0)
        {
            [_btn_All setTitle:@"SELECT ALL" forState:UIControlStateNormal];
            [_btn_All setBackgroundColor:[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
            isSelectAll=NO;
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"select"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        
        [self.tblv_Location_Table reloadData];
    }
}

- (NSArray *)leftButtons{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    [leftUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:.8f green:.8f blue:.8f alpha:1.0f] icon:[UIImage imageNamed:@"CellSlideImage1"] title:@""];
    [leftUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:.8f green:.8f blue:.8f alpha:1.0f] icon:[UIImage imageNamed:@"CellSlideImage2"] title:@""];
    [leftUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:.8f green:.8f blue:.8f alpha:1.0f] icon:[UIImage imageNamed:@"CellSlideImage3"] title:@""];
    
    
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
//                                                icon:[UIImage imageNamed:@"list.png"]];
    
    return leftUtilityButtons;
}
#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"check button was pressed");
            break;
        case 1:
            NSLog(@"clock button was pressed");
            break;
        case 2:
            NSLog(@"cross button was pressed");
            break;
        case 3:
            NSLog(@"list button was pressed");
        default:
            break;
    }
}

#pragma mark - Call Web Service
-(void)getLocationListData{
    if ([Utility isNetworkAvailable]==YES) {
     NSString *strLocationListingApi=[NSString stringWithFormat:@"%@%@",API,LOCATIONLISTING];
        DebugLog(@"strLocationListingApi:%@",strLocationListingApi);
    [[Singelton getInstance]jsonparse:^(NSDictionary* testResult){
        DebugLog(@"testResult====%@",testResult);
         [hud hideAnimated:YES];
        if ([[testResult valueForKey:@"success"] boolValue]==1) {
            arrmLocationList=[[testResult valueForKey:@"details"] mutableCopy];
//            NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//            [dic setObject:@"All" forKey:@"location"];
//            [dic setObject:@"4444" forKey:@"location_id"];
//            [arrmLocationList insertObject:dic atIndex:0];
             DebugLog(@"arrmLocationList====%@",arrmLocationList);
            if (arrmLocationList.count>0) {
//                for (int i=0; i<[arrmLocationList count]; i++)  {
//                    [arrmTotalCheckMark addObject:@"NO"];
//                }
//                DebugLog(@"arrmTotalCheckMark====%@",arrmTotalCheckMark);
                [_tblv_Location_Table reloadData];
            }
            else{
                _tblv_Location_Table.hidden=YES;
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
-(void)getEventData{
    
    dateFormatter1 = [[NSDateFormatter alloc]init];
    [dateFormatter1 setDateFormat:@"MM/dd/yyyy"];
    strDate1 = [dateFormatter1 stringFromDate:_dateSelected];
    NSLog(@"strDate1==%@",strDate1);
   
    if ([Utility isNetworkAvailable]==YES) {
        /**********Custom loader****************/
        self.view.userInteractionEnabled=NO;
        hud=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        NSString *strTestimonialsApi=[NSString stringWithFormat:@"%@%@",API,EVENTLISTINGBYDATE];
        DebugLog(@"The string value:%@",strTestimonialsApi);
        NSString *strPostParameter=[NSString stringWithFormat:@"date=%@&locationId=%@&language=%@",strDate1,@"",@"en"];
        DebugLog(@"strPostParameter:%@",strPostParameter);
        
        [[Singelton getInstance] jsonParseWithPostMethod:^(NSDictionary* testResult){
            DebugLog(@"testResult1====%@",testResult);
            self.view.userInteractionEnabled=YES;
            [hud hideAnimated:YES];
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                arrmEventList=[[testResult valueForKey:@"details"] mutableCopy];
                arrmCoppyOfEventList=[arrmEventList copy];
                _lbl_Day.text=[NSString stringWithFormat:@"%@",[testResult valueForKey:@"yiddish_date"]];
                _lbl_Date.text=[NSString stringWithFormat:@"%@",[testResult valueForKey:@"yiddish_week"]];

                 DebugLog(@"arrmCoppyOfEventList====%@",arrmCoppyOfEventList);
               
                if (arrmEventList.count>0) {
                    [_HomeTableView reloadData];
                     _HomeTableView.hidden=NO;
                }
                else{
                    _HomeTableView.hidden=YES;
                }
                
            }
            else{
                NSString *strName=[testResult valueForKey:@"yiddish_date"];
                if (strName.length>0) {
                _lbl_Day.text=[testResult valueForKey:@"yiddish_date"];
                    _lbl_Date.text=[testResult valueForKey:@"yiddish_week"];
                }
                else{
                _lbl_Day.text=[NSString stringWithFormat:@"%@",@""];
                _lbl_Date.text=[NSString stringWithFormat:@"%@",@""];
                }
                alert=[[SCLAlertView alloc]init];
                [alert showWarning:self title:@"Warning" subTitle:[testResult valueForKey:@"message"] closeButtonTitle:@"OK" duration:0.0f];
                 _HomeTableView.hidden=YES;
            }
        }andString:strTestimonialsApi andParam:strPostParameter];
    }
    else{
        alert=[[SCLAlertView alloc]init];
        [alert showWarning:self title:@"Warning" subTitle:@"Network error" closeButtonTitle:@"OK" duration:0.0f];
    }
    
}
/*#pragma mark - Uicollection DataSource
 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 return 16;
 }
 
 - (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
 return 1;
 }
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
 return 5.0;
 }
 
 
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
 cellLocationListCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LocationListCollectionViewCell" forIndexPath:indexPath];
 cellLocationListCollectionViewCell.layer.borderWidth=2.0f;
 cellLocationListCollectionViewCell.layer.cornerRadius=2.0f;
 
 if ([arrmCollctionIndex containsObject:[NSIndexPath indexPathForRow:indexPath.row inSection:0]]) {
 cellLocationListCollectionViewCell.layer.borderColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor;
 cellLocationListCollectionViewCell.lbl_Location_Name.textColor=[UIColor colorWithRed:10.0f/255.0f green:177.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
 
 DebugLog(@"reload");
 }
 else{
 cellLocationListCollectionViewCell.layer.borderColor=[UIColor lightGrayColor].CGColor;
 cellLocationListCollectionViewCell.lbl_Location_Name.textColor=[UIColor lightGrayColor];
 
 
 DebugLog(@"Don't");
 }
 
 //        cell.btn_GalleryImage.tag=indexPath.row;
 //        cell.layer.cornerRadius=15.0;
 //        [cell.btn_GalleryImage addTarget:self action:@selector(btn_GalleryImageAction:) forControlEvents:UIControlEventTouchUpInside];
 //        [cell.btn_GalleryImage setBackgroundImage:[_arrCombinedImage objectAtIndex:indexPath.row] forState:UIControlStateNormal];
 //        cell.backgroundColor=[UIColor clearColor];
 return cellLocationListCollectionViewCell;
 
 }
 
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 if (indexPath.row==0) {
 isFirstRowTap=YES;
 [arrmCollctionIndex removeAllObjects];
 NSIndexPath *index= [NSIndexPath indexPathForRow:indexPath.row inSection:0];
 [arrmCollctionIndex addObject:index];
 DebugLog(@"arrmCollctionIndex%@",arrmCollctionIndex);
 [_colv_Location_Cell reloadData];
 }
 else{
 if (isFirstRowTap) {
 [arrmCollctionIndex removeAllObjects];
 isFirstRowTap=NO;
 }
 
 NSIndexPath *index= [NSIndexPath indexPathForRow:indexPath.row inSection:0];
 if ([arrmCollctionIndex containsObject:index])
 {
 [arrmCollctionIndex removeObject:index];
 }
 else
 {
 [arrmCollctionIndex addObject:index];
 }
 DebugLog(@"arrmCollctionIndex%@",arrmCollctionIndex);
 [_colv_Location_Cell reloadData];
 //    NSIndexPath *index= [NSIndexPath indexPathForRow:indexPath.row inSection:0];
 //    [arrmCollctionIndex addObject:index];
 //    DebugLog(@"arrmCollctionIndex%@",arrmCollctionIndex);
 //    [_colv_Location_Cell reloadData];
 //
 
 ////    if (indexPath.section == 1)
 ////        return;
 ////
 NSArray<NSIndexPath*>* selectedIndexes = collectionView.indexPathsForSelectedItems;
 DebugLog(@"%@",selectedIndexes);
 for (int i = 0; i < selectedIndexes.count; i++) {
 NSIndexPath* currentIndex = selectedIndexes[i];
 if (![currentIndex isEqual:indexPath] && currentIndex.section != 1) {
 [collectionView deselectItemAtIndexPath:currentIndex animated:YES];
 }
 }
 }
 
 }
 
*/

@end
