//
//  HomeCell.h
//  new_project
//
//  Created by SAYAN MAC MINI on 1/23/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineHeader.h"


@interface HomeCell : SWTableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbl_1stOne;
@property (weak, nonatomic) IBOutlet UIImageView *imgv_forword_image;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Second;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Third;
@property (weak, nonatomic) IBOutlet UIImageView *imgv_Profile_Image;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Loction;

@end
