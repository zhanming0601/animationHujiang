//
//  ViewController.m
//  animationHujiang
//
//  Created by zhanming on 16/5/30.
//  Copyright © 2016年 zhanming. All rights reserved.
//

#import "ViewController.h"
#import "customView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    customView *customview=[[customView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    customview.center=self.view.center;
    
    [self.view addSubview:customview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
