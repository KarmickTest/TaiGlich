//
//  PopUpViewController.m
//  Taiglich
//
//  Created by Karmick on 14/03/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "PopUpViewController.h"
#import "DefineHeader.h"
#import "Constant.h"

@interface PopUpViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tblv_PopUp_Table;

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblv_PopUp_Table.delegate=self;
    _tblv_PopUp_Table.dataSource=self;
    DebugLog(@"%@",_arrmTitleFrontAndBackData);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn_Cancel_Click:(id)sender {
    [self.delegate PopUpViewControllerDidTapCancelButton:self];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrmTitleFrontAndBackData count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
   
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text=[[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"townName"];
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:20.0];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *itemToPassBack = [[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"townName"];
    [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack];
}

@end
