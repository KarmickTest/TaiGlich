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
@interface RegistrationViewController ()<UITextFieldDelegate,ServerConnectionDelegate>
{
    AppDelegate *app;
}
@property (strong, nonatomic) IBOutlet UIView *vw_shadow;
@property (strong, nonatomic) IBOutlet UIButton *btn_Continue;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_Name;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_number;
@property (strong, nonatomic) IBOutlet UIImageView *imgVw_logo;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    _vw_shadow.layer.cornerRadius=15.0;
    _vw_shadow.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _vw_shadow.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    _vw_shadow.layer.shadowOpacity = 1;
    _vw_shadow.layer.shadowRadius = 1.0;
    _btn_Continue.layer.cornerRadius=12.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
   
    if (textField==_txtfld_number) {
        [self animateTextView: YES];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        numberToolbar.barStyle = UIBarStyleBlack;
        numberToolbar.items = [NSArray arrayWithObjects:
                               [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
                               [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                               [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                               nil];
        [numberToolbar sizeToFit];
       _txtfld_number.inputAccessoryView = numberToolbar;
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
-(void)cancelNumberPad
{
    _txtfld_number.text=@"";
    [_txtfld_number resignFirstResponder];
}
-(void)doneWithNumberPad
{
   [_txtfld_number resignFirstResponder];
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

#pragma mark-Server Delegate
-(void)userRegistration:(id)result{
    NSLog(@"%@",result);
}
- (IBAction)Click_continue:(id)sender {
    if([app.devicetokenstring isEqualToString:@"(null)"] || app.devicetokenstring==nil){
        app.devicetokenstring=@"87e5171529505a6fc73ec3620a9f5392f89252a13e1a5de41234123de76d6ddcb2b2b38";
    }
    ServerConnection *mserverconnection=[[ServerConnection alloc]init];
    mserverconnection.delegate=self;
    [mserverconnection userRegistration:app.devicetokenstring deviceToken:app.devicetokenstring name:_txtfld_Name.text deviceType:@"IOS" registrationType:@"normal" language:@"en" phoneNo:_txtfld_number.text];
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
