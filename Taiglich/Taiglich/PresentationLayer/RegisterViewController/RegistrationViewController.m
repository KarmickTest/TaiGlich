//
//  RegistrationViewController.m
//  Taiglich
//
//  Created by SAYAN MAC MINI on 2/22/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "DefineHeader.h"
@interface RegistrationViewController ()<UITextFieldDelegate>
{
    AppDelegate *app;
    MBProgressHUD *hud;
    SCLAlertView *alert;
    BOOL isSkipSelect;
    HomeViewController* mHomeViewController;
    NSString *strName;
}
@property (strong, nonatomic) IBOutlet UIView *vw_shadow;
@property (strong, nonatomic) IBOutlet UIButton *btn_Continue;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_Name;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_number;
@property (strong, nonatomic) IBOutlet UIImageView *imgVw_logo;
@property (weak, nonatomic) IBOutlet UITextView *txtv_TextShow;
@property (weak, nonatomic) IBOutlet UIButton *btn_Skip_This_Page;
@property (weak, nonatomic) IBOutlet UIImageView *imgv_Skip_Image;

@end

@implementation RegistrationViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    _txtv_TextShow.userInteractionEnabled=NO;
    //_txtv_TextShow.text = @"Why do we need this information?\n We need your phone number to keep track of your saved events.\n We will never share your phone number with anyone.";
    self.txtv_TextShow.contentInset = UIEdgeInsetsMake(2.0,1.0,0,0.0);
    [_imgv_Skip_Image setImage:[UIImage imageNamed:@"checkbox_normal_16"]];
    isSkipSelect=TRUE;

    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
   // _vw_shadow.layer.cornerRadius=15.0;
    _vw_shadow.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _vw_shadow.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    _vw_shadow.layer.shadowOpacity = 1;
    _vw_shadow.layer.shadowRadius = 1.0;
    //_btn_Continue.layer.cornerRadius=12.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   
    if (textField==_txtfld_Name) {
        [self animateTextView: YES];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        numberToolbar.barStyle = UIBarStyleBlack;
        numberToolbar.items = [NSArray arrayWithObjects:
                               [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
                               [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                               [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                               nil];
        [numberToolbar sizeToFit];
       _txtfld_Name.inputAccessoryView = numberToolbar;
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    if (textField==_txtfld_number) {
//        
//         [self animateTextView: YES];
//    }
  
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    if (textField==_txtfld_number) {
//       [self animateTextView: NO];
//    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Self Method

-(void)cancelNumberPad
{
    _txtfld_Name.text=@"";
    [_txtfld_Name resignFirstResponder];
}
-(void)doneWithNumberPad
{
   [_txtfld_Name resignFirstResponder];
}
- (void) animateTextView:(BOOL) up
{
    
    if ([[UIScreen mainScreen ] bounds].size.height<=568) {
        
        [UIView animateWithDuration:.3f animations:^{
            
            _vw_shadow.frame = CGRectMake( _vw_shadow.frame.origin.x,_vw_shadow.frame.origin.y-50 , _vw_shadow.frame.size.width, _vw_shadow.frame.size.height );
            _imgVw_logo.frame = CGRectMake( _imgVw_logo.frame.origin.x,_imgVw_logo.frame.origin.y-50 , _imgVw_logo.frame.size.width, _imgVw_logo.frame.size.height );
            
        }];
    }
   
}

#pragma mark - Button Action

- (IBAction)btn_Skip_Click:(id)sender {
    if (isSkipSelect){
        DebugLog(@"Not selected");
        [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Login"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [_imgv_Skip_Image setImage:[UIImage imageNamed:@"checkbox_activel_16"]];
        isSkipSelect=FALSE;
        mHomeViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:mHomeViewController animated:YES];
    }
    else{
         DebugLog(@"selected");
        [_imgv_Skip_Image setImage:[UIImage imageNamed:@"checkbox_normal_16"]];
        isSkipSelect=TRUE;
    }
}

- (IBAction)Click_continue:(id)sender {
    if([DataValidation isNullString:_txtfld_Name.text]){
      [Utility showAlertWithTitle:@"Alert" message:@"Please enter your phone number"];
    }
    else if (_txtfld_Name.text.length < 10 || _txtfld_Name.text.length > 10){
      [Utility showAlertWithTitle:@"Alert" message:@"Phone number should be 10 digits"];
    }
    else{
       [self postRegisterData];
    }
}


#pragma mark -Call Web Service
-(void)postRegisterData{
    if([app.devicetokenstring isEqualToString:@"(null)"] || app.devicetokenstring==nil){
        app.devicetokenstring=@"87e5171529505a6fc73ec3620a9f5392f89252a13e1a5de41234123de76d6ddcb2b2b38";
    }
    if (_txtfld_number.text.length==0) {
        strName=@"";
    }
    else{
        strName=_txtfld_number.text;
    }
    if ([Utility isNetworkAvailable]==YES) {
        /**********Custom loader****************/
        self.view.userInteractionEnabled=NO;
        
        NSString *strPostParameter=[NSString stringWithFormat:@"deviceId=%@&deviceToken=%@&deviceType=%@&name=%@&registrationType=%@&language=%@&phoneNo=%@",app.devicetokenstring,app.devicetokenstring,@"iOS",strName,@"normal",@"en",_txtfld_Name.text];
        DebugLog(@"strPostParameter:%@",strPostParameter);
        hud=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        NSString *strRegistrationApi=[NSString stringWithFormat:@"%@%@",API,REGISTRATION];
        DebugLog(@"The string value:%@",strRegistrationApi);
        
        [[Singelton getInstance] jsonParseWithPostMethod:^(NSDictionary* testResult){
            DebugLog(@"Testimonials====%@",testResult);
            self.view.userInteractionEnabled=YES;
            [hud hideAnimated:YES];
            if ([[testResult valueForKey:@"success"] boolValue]==1) {
                [[NSUserDefaults standardUserDefaults] setObject:@"Yes" forKey:@"Login"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                mHomeViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
                [self.navigationController pushViewController:mHomeViewController animated:YES];
                
            }
            else{
                
            }
        }andString:strRegistrationApi andParam:strPostParameter];
    }
    else{
        [alert showWarning:self title:@"Warning" subTitle:@"Network error" closeButtonTitle:@"OK" duration:0.0f];
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
