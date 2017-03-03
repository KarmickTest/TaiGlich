//
//  FormViewController.m
//  Taiglich
//
//  Created by SAYAN MAC MINI on 1/31/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "FormViewController.h"
#import "FormTableViewCell.h"

@interface FormViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tbl_form;
@property (strong, nonatomic) IBOutlet UIImageView *imgVw_form;

@end

@implementation FormViewController

#pragma mark - View life cycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame=_imgVw_form.frame;
    UIVisualEffectView *blurEffectView1 = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [_imgVw_form addSubview:blurEffectView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    FormTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"FormTableViewCell"];
    if (cell==nil)
    {
        cell =(FormTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FormTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
