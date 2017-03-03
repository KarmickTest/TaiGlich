//
//  FooterView.m
//  RoundAfire
//
//  Created by Imac on 10/06/16.
//  Copyright © 2016 karmick123. All rights reserved.
//

#import "FooterView.h"
#import "Constant.h"

@implementation FooterView
- (IBAction)tabbar_Button_First_Click:(id)sender{
    [_delegate footerButtonClicked:0];
}
- (IBAction)tabbar_Button_Second_Click:(id)sender{
    [_delegate footerButtonClicked:1];
}
- (IBAction)tabbar_Button_Third_Click:(id)sender{
    [_delegate footerButtonClicked:2];
}
- (IBAction)tabbar_Button_Fourth_Click:(id)sender{
  [_delegate footerButtonClicked:3];
}
- (IBAction)tabbar_Button_Fifth_Click:(id)sender{
    [_delegate footerButtonClicked:4];
}



@end
