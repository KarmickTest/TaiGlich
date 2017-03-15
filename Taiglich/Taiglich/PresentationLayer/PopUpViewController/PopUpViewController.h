//
//  PopUpViewController.h
//  Taiglich
//
//  Created by Karmick on 14/03/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopUpViewController;

@protocol PopUpViewControllerDelegate <NSObject>
- (void)PopUpViewControllerDidTapCancelButton:(PopUpViewController *)controller;
- (void)addItemViewController:(PopUpViewController *)controller didFinishEnteringItem:(NSString *)item dayValue:(NSMutableArray *)arrm locationId:(NSString*)strId;

@end

@interface PopUpViewController : UIViewController

@property (nonatomic, strong) id <PopUpViewControllerDelegate> delegate;

- (IBAction)btn_Cancel_Click:(id)sender;
@property (strong, nonatomic) NSMutableArray *arrmTitleFrontAndBackData;
@property (strong, nonatomic) NSString *strComingFromYiddish;

@end
