//
//  FormViewController.m
//  Taiglich
//
//  Created by SAYAN MAC MINI on 1/31/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "FormViewController.h"
#import "FormTableViewCell.h"
#import "DefineHeader.h"
#import "Constant.h"

@interface FormViewController ()
{
    EngagementOneViewController *mEngagementOneViewController;
    EngagementTwoViewController *mEngagementTwoViewController;
    NSInteger buttonTag;
    BOOL buttonTapped;
    SCLAlertView *alert;
}
@property (strong, nonatomic) IBOutlet UITableView *tbl_form;
@property (strong, nonatomic) IBOutlet UIImageView *imgVw_form;

@end

@implementation FormViewController

#pragma mark - View life cycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    blurEffectView.frame=_imgVw_form.frame;
//    UIVisualEffectView *blurEffectView1 = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//
//    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    
//    [_imgVw_form addSubview:blurEffectView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn_Radio_Click:(id)sender {
    buttonTapped=YES;
    UIButton *button = (UIButton *)sender;
     buttonTag = button.tag;
    DebugLog(@"buttonTag%ld", (long)buttonTag);
   
    
}

- (IBAction)btn_Submit_Click:(id)sender {
    if (buttonTapped) {
        if (buttonTag ==7) {
        mEngagementOneViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EngagementOneViewController"];
        mEngagementOneViewController.strPassButtonValue=[NSString stringWithFormat:@"%ld",(long)buttonTag];
        DebugLog(@"strPassButtonValue%@", mEngagementOneViewController.strPassButtonValue);
        [self.navigationController pushViewController:mEngagementOneViewController animated:NO];
     }
    else if(buttonTag == 8){
        mEngagementTwoViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EngagementTwoViewController"];
       [self.navigationController pushViewController:mEngagementTwoViewController animated:NO];

    }
    else{
        alert=[[SCLAlertView alloc]init];
        [alert showWarning:self title:@"Warning" subTitle:@"Under development" closeButtonTitle:@"OK" duration:0.0f];
     
    }
    }
    else{
        alert=[[SCLAlertView alloc]init];
        [alert showWarning:self title:@"Warning" subTitle:@"Please select atleast one event type" closeButtonTitle:@"OK" duration:0.0f];
    }
   
}



@end
