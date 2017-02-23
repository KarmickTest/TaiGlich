//
//  FooterView.h
//  RoundAfire
//
//  Created by Imac on 10/06/16.
//  Copyright © 2016 karmick123. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAction <NSObject>

-(void)footerButtonClicked:(int)btnTag;

@end

@interface FooterView : UIView
@property id<CustomAction> delegate;
- (IBAction)tabbar_Button_First_Click:(id)sender;
- (IBAction)tabbar_Button_Second_Click:(id)sender;
- (IBAction)tabbar_Button_Third_Click:(id)sender;
- (IBAction)tabbar_Button_Fourth_Click:(id)sender;
- (IBAction)tabbar_Button_Fifth_Click:(id)sender;



@end
