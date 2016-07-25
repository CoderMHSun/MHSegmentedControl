//
//  MHSegmentView.m
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "MHSegmentView.h"
#import "HeaderButtonsView.h"
#import "MHPagerView.h"

@interface MHSegmentView ()<HeaderButtonsViewDelegate>

@property (nonatomic, strong) HeaderButtonsView *headerButtonsView;

@property (nonatomic, strong) UIScrollView *contentScrollView;


@property (nonatomic, strong) NSArray *titlesArray;

@end

@implementation MHSegmentView

+ (instancetype)segmentViewWithFrame:(CGRect)frame sectionTitles:(NSArray*)titlesArray contentBackGroundColor:(UIColor *)color {
    
    MHSegmentView *segmentview = [[MHSegmentView alloc] init];
    
    segmentview.titlesArray = titlesArray;
    
    segmentview.frame = frame;
    
    segmentview.backgroundColor = color;
    
    return segmentview;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.headerButtonsView];
    [self addSubview:self.contentScrollView];
    
    
}

#pragma mark - **************** HeaderButtonsView delegate
- (void)headerButtonsView:(HeaderButtonsView *)headerButtonsView ClickIndex:(NSInteger)index {
    [_headerButtonsView setCurrentIndex:index];
    
    CGSize size = self.frame.size;
    [self.contentScrollView setContentOffset:CGPointMake(size.width*index, 0) animated:YES];
}



- (HeaderButtonsView *)headerButtonsView {
    if (!_headerButtonsView) {
        _headerButtonsView = [[HeaderButtonsView alloc] init];
        _headerButtonsView.frame = CGRectMake(0, 0, ScreenSize.width, HeaderHeight);
        _headerButtonsView.delegate = self;
    }
    return _headerButtonsView;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.showsHorizontalScrollIndicator = YES;
    }
    return _contentScrollView;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    _contentScrollView.contentSize = CGSizeMake(frame.size.width*self.titlesArray.count, frame.size.height);
    
}

- (void)setTitlesArray:(NSArray *)titlesArray {
    _titlesArray = titlesArray;
    
    _headerButtonsView.sectionTitles = titlesArray;
    
    for (int i = 0; i<titlesArray.count; i++) {
        //创建pagerView
        MHPagerView *pagerView = [[MHPagerView alloc] init];
        pagerView.frame = [self getPagerViewFrameWithIndex:i];
        
    }
    
    
    
    
}

- (CGRect)getPagerViewFrameWithIndex:(NSInteger)index {
    
    return CGRectZero;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    _contentScrollView.backgroundColor = backgroundColor;
}

@end
