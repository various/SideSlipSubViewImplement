//
//  HomeViewController.m
//  SideSlipSubViewImplement
//
//  Created by Tim Geng on 3/16/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) IBOutlet UIButton *menuButton;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToHomeController)];
    [self.view addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMove:)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view from its nib.
}

-(void)panMove:(UIPanGestureRecognizer *)gesture{
    CGPoint translation = [gesture translationInView:self.view];
    self.moveHomeView(translation.x);
    
}

-(void)backToHomeController{
    self.menuButton.tag = 0;
    self.showLeftBlock(self.menuButton);
}

-(IBAction)showLeftViewController:(id)sender{
    UIButton *button = (UIButton *)sender;
    self.showLeftBlock(button);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
