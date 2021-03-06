//
//  ContainerViewController.m
//  SideSlipSubViewImplement
//
//  Created by Tim Geng on 3/16/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ContainerViewController.h"
#import "LeftViewController.h"
#import "HomeViewController.h"

#define kOffsexX 70
@interface ContainerViewController ()

@property(nonatomic,strong) LeftViewController *leftViewController;
@property(nonatomic,strong) HomeViewController *homeViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftViewController = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    [self.view addSubview:self.leftViewController.view];
    [self addChildViewController:self.leftViewController];
    [self.leftViewController didMoveToParentViewController:self];
    
    self.homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self.view addSubview:self.homeViewController.view];
    [self addChildViewController:self.homeViewController];
    [self.homeViewController didMoveToParentViewController:self];
    
    
    
    [self initHomeViewShadow];
    
    [self initShowMenuAction];
    
    [self initPanGestureAction];
    // Do any additional setup after loading the view from its nib.
}

-(void)initPanGestureAction{
    __weak typeof(self) weakSelf = self;

    self.homeViewController.moveHomeView = ^void(UIPanGestureRecognizer *panGesture){
        CGPoint translation = [panGesture translationInView:weakSelf.view];
        switch (panGesture.state) {
            case UIGestureRecognizerStateBegan:
                
                break;
            case UIGestureRecognizerStateChanged:
                weakSelf.homeViewController.view.frame = CGRectMake(translation.x, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);

                break;
            case UIGestureRecognizerStateEnded:
                
                if (translation.x <= (weakSelf.view.frame.size.width - kOffsexX)/2) {
                    
                    [UIView animateKeyframesWithDuration:0.7 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
                        
                        weakSelf.homeViewController.view.frame = CGRectMake(0, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
                    } completion:^(BOOL finished){
                        weakSelf.homeViewController.menuButton.tag = 1;
                    }];
                    
                }else{
                    [UIView animateKeyframesWithDuration:0.7 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
                        
                        weakSelf.homeViewController.view.frame = CGRectMake(weakSelf.view.frame.size.width - kOffsexX, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
                    } completion:^(BOOL finished){
                        weakSelf.homeViewController.menuButton.tag = 0;
                    }];
                }
                break;
                
            default:
                break;
        }
        
        

        
    };
}

-(void)initHomeViewShadow{
    self.homeViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.homeViewController.view.layer.shadowOpacity = 0.8;
    self.homeViewController.view.layer.shadowOffset = CGSizeMake(-2, -2);
}

-(void)initShowMenuAction{
    __weak typeof(self) weakSelf = self;

    self.homeViewController.showLeftBlock = ^void(UIButton *sender){
        if (sender.tag == 1) {
            [UIView animateKeyframesWithDuration:0.7 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
                
                weakSelf.homeViewController.view.frame = CGRectMake(weakSelf.view.frame.size.width - kOffsexX, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
            } completion:^(BOOL finished){
                sender.tag = 0;
            }];
        }else if(sender.tag == 0){
            [UIView animateKeyframesWithDuration:0.7 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
                
                weakSelf.homeViewController.view.frame = CGRectMake(0, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
            } completion:^(BOOL finished){
                sender.tag = 1;
            }];
        }
        
    };
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
