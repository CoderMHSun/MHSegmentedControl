//
//  HeaderButtonsView.m
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "HeaderButtonsView.h"



@interface HeaderButtonsView ()
{
    UIButton *lastBtn;
}
@property (nonatomic, strong) NSMutableArray *buttonsArray;

@end


@implementation HeaderButtonsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.buttonsArray = [NSMutableArray array];
    
}


- (CGRect)getFrameWith:(int)index {
    NSInteger total = self.sectionTitles.count;
    
    CGFloat x = ((float)index/total)*ScreenSize.width;
    
    CGRect rect = CGRectMake(x, 0, ScreenSize.width/total, HeaderHeight);
    
    return rect;
}

- (void)setSectionTitles:(NSArray *)sectionTitles {
    _sectionTitles = sectionTitles;
    
    for (int i = 0; i<_sectionTitles.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSString *title = self.sectionTitles[i];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor lightGrayColor];
        
        btn.frame = [self getFrameWith:i];
        
        btn.tag = i;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttonsArray addObject:btn];
        
        [self addSubview:btn];
        
        if (i == 0) {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            lastBtn = btn;
        }
    }
    
}

- (void)btnClick:(UIButton *)sender {
    NSLog(@"HeaderButtonsView的按钮点击了%ld",sender.tag);
    if ([self.delegate respondsToSelector:@selector(headerButtonsView:ClickIndex:)]) {
        [self.delegate headerButtonsView:self ClickIndex:sender.tag];
    }
    
}

- (void)setCurrentIndex:(NSInteger)index {
    [lastBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    UIButton *currentBtn = _buttonsArray[index];
    [currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    lastBtn = currentBtn;
}

@end
