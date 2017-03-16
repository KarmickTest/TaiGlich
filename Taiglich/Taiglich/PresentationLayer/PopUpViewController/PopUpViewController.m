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
{
    NSMutableArray *arrmDayData;;
}
@property (strong, nonatomic) IBOutlet UITableView *tblv_PopUp_Table;

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblv_PopUp_Table.delegate=self;
    _tblv_PopUp_Table.dataSource=self;
    DebugLog(@"%@",_arrmTitleFrontAndBackData);
    arrmDayData=[[NSMutableArray alloc]init];
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

    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:20.0];
    cell.textLabel.textColor = [UIColor darkGrayColor];

    if ([_strComingFromYiddish isEqualToString:@"Yes"]){
      cell.textLabel.text=[[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"week"];
    }
    else if ([_strComingFromYiddish isEqualToString:@"Day"]){
     cell.textLabel.text=[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row];
    }
    else if ([_strComingFromYiddish isEqualToString:@"EventLocation"]){
        cell.textLabel.text=[[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row]valueForKey:@"location"];
    }
    else{
      cell.textLabel.text=[[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"townName"];
    }
   
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_strComingFromYiddish isEqualToString:@"Yes"]){
        arrmDayData=[[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"days"];
        NSString *itemToPassBack = [[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"week"];
        [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack dayValue:arrmDayData locationId:@""];
    }
    else if ([_strComingFromYiddish isEqualToString:@"Day"]){
        DebugLog(@"arrmDayData%@",arrmDayData);
        NSString *itemToPassBack = [_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] ;
        [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack dayValue:arrmDayData locationId:@""];
    }
    else if ([_strComingFromYiddish isEqualToString:@"EventLocation"]){
        DebugLog(@"arrmDayData%@",arrmDayData);
        NSString *itemToPassBack = [[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"location"] ;
        NSString *itemToPassBack1 = [[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"location_id"] ;
        [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack dayValue:arrmDayData locationId:itemToPassBack1];
    }
    else{
    NSString *itemToPassBack = [[_arrmTitleFrontAndBackData objectAtIndex:indexPath.row] valueForKey:@"townName"];
    [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack dayValue:arrmDayData locationId:@""];
    }
}

@end
