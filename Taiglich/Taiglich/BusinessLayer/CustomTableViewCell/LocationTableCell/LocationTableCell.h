//
//  LocationTableCell.h
//  Taiglich
//
//  Created by Karmick on 27/02/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_Location_Name;
@property (weak, nonatomic) IBOutlet UIImageView *imgv_Checkd_Unchecked;

@end
