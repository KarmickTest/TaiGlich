//
//  FormViewController.h
//  Taiglich
//
//  Created by SAYAN MAC MINI on 1/31/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RadioButton;
@interface FormViewController : UIViewController
@property (weak,nonatomic) id delegate;
@property (nonatomic, strong) IBOutlet RadioButton* radioButton;

@end
