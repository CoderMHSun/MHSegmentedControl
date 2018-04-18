//
//  ViewController.m
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "ViewController.h"
#import "MHSegmentView.h"

@interface ViewController ()<MHSegmentViewDelegate>

@end

@implementation ViewController

#define RandomColor (arc4random()%255)/255.0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MHSegmentView *seg = [MHSegmentView segmentViewWithTitles:@[@"第一块",@"第二块",@"第三块"] delegate:self];
    seg.frame = CGRectMake(0, 20, 320, 480);
    [self.view addSubview:seg];
    
        
}


- (UIView *)segmentView:(MHSegmentView *)segmentView index:(NSInteger)index {
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:RandomColor green:RandomColor blue:RandomColor alpha:1];
    return view;
    
}

@end
