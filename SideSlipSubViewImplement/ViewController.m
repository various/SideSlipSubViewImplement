//
//  ViewController.m
//  SideSlipSubViewImplement
//
//  Created by Tim Geng on 3/14/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
@interface ViewController ()

@property(nonatomic,strong) LeftViewController *leftViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *leftItemButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(showLeftViewController)];
    self.navigationItem.leftBarButtonItem = leftItemButton;
    self.leftViewController = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    self.leftViewController.view.frame = self.view.frame;
    [self.view addSubview:self.leftViewController.view];
}

-(void)showLeftViewController{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
