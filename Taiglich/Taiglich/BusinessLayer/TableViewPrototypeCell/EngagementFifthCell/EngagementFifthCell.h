//
//  EngagementFifthCell.h
//  Taiglich
//
//  Created by Karmick on 09/03/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineHeader.h"
@class RadioButton;
@interface EngagementFifthCell : UITableViewCell
@property (strong, nonatomic) IBOutlet RadioButton *btn_Cell_Radio;
@property (strong, nonatomic) IBOutlet RadioButton *btn_Cell_Radio1;
@property (strong, nonatomic) IBOutlet RadioButton *btn_Cell_Radio2;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Entity_Father_Title;

@end
