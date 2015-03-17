//
//  HomeViewController.h
//  SideSlipSubViewImplement
//
//  Created by Tim Geng on 3/16/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property(nonatomic,copy) void(^showLeftBlock)(UIButton *sender);
@property(nonatomic,copy) void(^moveHomeView)(float offsetX);

@end
