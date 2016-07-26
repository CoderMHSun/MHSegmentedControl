//
//  ViewController.m
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "ViewController.h"
#import "MHSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MHSegmentView *seg = [MHSegmentView segmentViewWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300) sectionTitles:@[@"第一",@"第二",@"第三"] contentBackGroundColor:[UIColor clearColor]];
    
    [self.view addSubview:seg];
    
    
    [seg setDataArray:@[@[@"111",@"222"],@[@"333",@"444"],@[@"555",@"666",@"777"]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
